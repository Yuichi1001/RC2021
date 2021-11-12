#include <algorithm>
#include <chrono>
#include <iostream>
#include <opencv2/opencv.hpp>
#include "../include/rcnn_ros/backbone.hpp"
#include "../include/rcnn_ros/RpnDecodePlugin.h"
#include "../include/rcnn_ros/RpnNmsPlugin.h"
#include "../include/rcnn_ros/RoiAlignPlugin.h"
#include "../include/rcnn_ros/PredictorDecodePlugin.h"
#include "../include/rcnn_ros/BatchedNmsPlugin.h"
#include "../include/rcnn_ros/MaskRcnnInferencePlugin.h"
#include "../include/rcnn_ros/calibrator.hpp"
#include "rcnn_ros/detection.h"
#include "rcnn_ros/results.h"
#include "rcnn_ros/point.h"
#include <cv_bridge/cv_bridge.h>
#include <ros/ros.h>
#include"mv_driver/raw_img.h"
#define DEVICE 0
#define BATCH_SIZE 1
#define BACKBONE_RESNETTYPE R50
// data
static const std::vector<float> PIXEL_MEAN = { 103.53, 116.28, 123.675 };
static const std::vector<float> PIXEL_STD = {1.0, 1.0, 1.0};
static constexpr float MIN_SIZE = 800.0;
static constexpr float MAX_SIZE = 1333.0;
static constexpr int NUM_CLASSES = 16;
static constexpr int INPUT_H = 480;
static constexpr int INPUT_W = 640;
static int IMAGE_HEIGHT = 800;
static int IMAGE_WIDTH = 1333;
// backbone
static const int RES2_OUT_CHANNELS = (BACKBONE_RESNETTYPE == R18 ||
BACKBONE_RESNETTYPE == R34) ? 64 : 256;
// rpn
static const std::vector<float> ANCHOR_SIZES = { 32, 64, 128, 256, 512 };
static const std::vector<float> ASPECT_RATIOS = { 0.5, 1.0, 2.0 };
static constexpr int PRE_NMS_TOP_K_TEST = 6000;
static constexpr float RPN_NMS_THRESH = 0.7;
static constexpr int POST_NMS_TOPK = 1000;
// roialign
static constexpr int STRIDES = 16;
static constexpr int SAMPLING_RATIO = 0;
static constexpr int POOLER_RESOLUTION = 14;
// roihead
static constexpr float NMS_THRESH_TEST = 0.5;
static constexpr int DETECTIONS_PER_IMAGE = 100;
static constexpr float SCORE_THRESH = 0.8;
static const std::vector<float> BBOX_REG_WEIGHTS = { 10.0, 10.0, 5.0, 5.0 };
static bool MASK_ON = true;

static const char* INPUT_NODE_NAME = "images";
static const std::vector<std::string> OUTPUT_NAMES = { "scores", "boxes",
"labels", "masks" };



void calculateRatio() {
    float ratio = MIN_SIZE / static_cast<float>(std::min(INPUT_H, INPUT_W));
    float newh = 0, neww = 0;
    if (INPUT_H < INPUT_W) {
        newh = MIN_SIZE;
        neww = ratio * INPUT_W;
    } else {
        newh = ratio * INPUT_H;
        neww = MIN_SIZE;
    }
    if (std::max(newh, neww) > MAX_SIZE) {
        ratio = MAX_SIZE / static_cast<float>(std::max(newh, neww));
        newh = newh * ratio;
        neww = neww * ratio;
    }
    IMAGE_HEIGHT = static_cast<int>(newh + 0.5);
    IMAGE_WIDTH = static_cast<int>(neww + 0.5);
}



void doInference(IExecutionContext& context, cudaStream_t& stream, std::vector<void*>& buffers,
std::vector<float>& input, std::vector<float*>& output) {
    CUDA_CHECK(cudaMemcpyAsync(buffers[0], input.data(), BATCH_SIZE * INPUT_H * INPUT_W * 3 * sizeof(float),
    cudaMemcpyHostToDevice, stream));

    context.enqueue(BATCH_SIZE, buffers.data(), stream, nullptr);

    CUDA_CHECK(cudaMemcpyAsync(output[0], buffers[1], BATCH_SIZE * DETECTIONS_PER_IMAGE * sizeof(float),
    cudaMemcpyDeviceToHost, stream));
    CUDA_CHECK(cudaMemcpyAsync(output[1], buffers[2], BATCH_SIZE * DETECTIONS_PER_IMAGE * 4 * sizeof(float),
    cudaMemcpyDeviceToHost, stream));
    CUDA_CHECK(cudaMemcpyAsync(output[2], buffers[3], BATCH_SIZE * DETECTIONS_PER_IMAGE * sizeof(float),
    cudaMemcpyDeviceToHost, stream));
    CUDA_CHECK(cudaMemcpyAsync(output[3], buffers[4],
        BATCH_SIZE * DETECTIONS_PER_IMAGE * POOLER_RESOLUTION * POOLER_RESOLUTION * sizeof(float),
        cudaMemcpyDeviceToHost, stream));

    cudaStreamSynchronize(stream);
}






ros::Publisher pub;
void imageCallback(const mv_driver::raw_imgPtr& msg);
IExecutionContext* context;
ICudaEngine* engine;
IRuntime* runtime;
cudaStream_t stream;
std::vector<float> scores_h(BATCH_SIZE * DETECTIONS_PER_IMAGE);
std::vector<float> boxes_h(BATCH_SIZE * DETECTIONS_PER_IMAGE * 4);
std::vector<float> classes_h(BATCH_SIZE * DETECTIONS_PER_IMAGE);
std::vector<float> masks_h;
std::vector<float> data(BATCH_SIZE * INPUT_H * INPUT_W * 3, 0);
std::vector<void*> buffers;
std::vector<float*> outputs;
int num=0;
int main(int argc, char** argv) {
    cudaSetDevice(DEVICE);

    std::string engineFile = "/home/qudoudou/RC2021/src/rcnn_ros/mask.engine";


    // calculate ratio
    calculateRatio();

    // deserialize the .engine and run inference
    std::ifstream file(engineFile, std::ios::binary);
    if (!file.good()) {
        std::cerr << "read " << engineFile << " error!" << std::endl;
        return -1;
    }

    std::string trtModelStream;
    size_t modelSize{ 0 };
    file.seekg(0, file.end);
    modelSize = file.tellg();
    file.seekg(0, file.beg);
    trtModelStream.resize(modelSize);
    assert(!trtModelStream.empty());
    file.read(const_cast<char*>(trtModelStream.c_str()), modelSize);
    file.close();



    // build engine
    std::cout << "build engine" << std::endl;
    runtime = createInferRuntime(gLogger);
    assert(runtime != nullptr);
    engine = runtime->deserializeCudaEngine(trtModelStream.c_str(), modelSize);
    assert(engine != nullptr);
    context = engine->createExecutionContext();
    assert(context != nullptr);
    runtime->destroy();


    CUDA_CHECK(cudaStreamCreate(&stream));
    ROS_WARN("engine init done");


    // prepare input data

    void *data_d, *scores_d, *boxes_d, *classes_d, *masks_d;
    CUDA_CHECK(cudaMalloc(&data_d, BATCH_SIZE * INPUT_H * INPUT_W * 3 * sizeof(float)));
    CUDA_CHECK(cudaMalloc(&scores_d, BATCH_SIZE * DETECTIONS_PER_IMAGE * sizeof(float)));
    CUDA_CHECK(cudaMalloc(&boxes_d, BATCH_SIZE * DETECTIONS_PER_IMAGE * 4 * sizeof(float)));
    CUDA_CHECK(cudaMalloc(&classes_d, BATCH_SIZE * DETECTIONS_PER_IMAGE * sizeof(float)));



    buffers = { data_d, scores_d, boxes_d, classes_d };
    outputs = {scores_h.data(), boxes_h.data(), classes_h.data()};

    //mask on
        CUDA_CHECK(cudaMalloc(&masks_d,
        BATCH_SIZE * DETECTIONS_PER_IMAGE * POOLER_RESOLUTION * POOLER_RESOLUTION * sizeof(float)));
        masks_h.resize(BATCH_SIZE * DETECTIONS_PER_IMAGE * POOLER_RESOLUTION * POOLER_RESOLUTION);
        buffers.push_back(masks_d);
        outputs.push_back(masks_h.data());
    //mask on



    ros::init(argc, argv, "rcnn_ros");
    ros::start();
    ros::NodeHandle n;

    ros::Subscriber imageSub = n.subscribe("/raw_img", 5, &imageCallback);
    pub = n.advertise<rcnn_ros::results>("/rcnn_results", 20);
    ros::Rate loop_rate(30);
    while (ros::ok())
    {
	ros::spinOnce();
	loop_rate.sleep();
    }

    cudaStreamDestroy(stream);
    CUDA_CHECK(cudaFree(data_d));
    CUDA_CHECK(cudaFree(scores_d));
    CUDA_CHECK(cudaFree(boxes_d));
    CUDA_CHECK(cudaFree(classes_d));
  //mask on
    CUDA_CHECK(cudaFree(masks_d));
  //mask on
    context->destroy();
    engine->destroy();

    return 0;
}

void imageCallback(const mv_driver::raw_imgPtr& msg)
{
	num++;	//读一张图片就处理一次

	cv::Mat img = cv_bridge::toCvCopy(msg->color, sensor_msgs::image_encodings::BGR8)->image;
	if (!img.empty())
	{
		img = preprocessImg(img, INPUT_W, INPUT_H);
		for (int i = 0; i < INPUT_H * INPUT_W * 3; i++)
			data[i] = static_cast<float>(*(img.data + i));

		// Run inference
		auto start = std::chrono::system_clock::now();

		doInference(*context, stream, buffers, data, outputs);

		auto end = std::chrono::system_clock::now();
		std::cout << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;

		float h_ratio = static_cast<float>(INPUT_H) / IMAGE_HEIGHT;
		float w_ratio = static_cast<float>(INPUT_W) / IMAGE_WIDTH;
        std::vector<rcnn_ros::detection> res;
		for (int i = 0; i < DETECTIONS_PER_IMAGE; i++) {
		        if (scores_h[i] > SCORE_THRESH) {
			    rcnn_ros::detection tmp;
		            float x1 = boxes_h[i * 4 + 0] * w_ratio;
		            float y1 = boxes_h[i * 4 + 1] * h_ratio;
		            float x2 = boxes_h[i * 4 + 2] * w_ratio;
		            float y2 = boxes_h[i * 4 + 3] * h_ratio;
		            int label = classes_h[i];
		            float score = scores_h[i];
		            tmp.x1 = x1;
		            tmp.y1 = y1;
		            tmp.x2 = x2;
		            tmp.y2 = y2;
		            tmp.label = label;
		            tmp.score = score;
		            printf("boxes:[%.6f, %.6f, %.6f, %.6f] scores: %.4f label: %d \n", x1, y1, x2, y2, score, label);
		            cv::Rect r(x1, y1, x2 - x1, y2 - y1);
		            cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
		            cv::putText(img, std::to_string(label), cv::Point(r.x, r.y - 1), cv::FONT_HERSHEY_PLAIN, 1.2,
		            cv::Scalar(0xFF, 0xFF, 0xFF), 2);

	  		    //mask on
		            if (MASK_ON) {
		                cv::Mat maskPart = cv::Mat::zeros(cv::Size(POOLER_RESOLUTION, POOLER_RESOLUTION), CV_32FC1);
		                memcpy(maskPart.data,
		                  &masks_h[i * POOLER_RESOLUTION * POOLER_RESOLUTION],
		                  POOLER_RESOLUTION * POOLER_RESOLUTION * sizeof(float));

		                cv::Rect r(cv::Point(floor(x1) - 1 < 0 ? 0 : floor(x1) - 1,
		                                     floor(y1) - 1 < 0 ? 0 : floor(y1) - 1),
		                           cv::Point(ceil(x2) + 1 > INPUT_W ? INPUT_W : ceil(x2) + 1,
		                                     ceil(y2) + 1 > INPUT_H ? INPUT_H : ceil(y2) + 1));
		                cv::resize(maskPart, maskPart, cv::Size(r.width, r.height));
		                cv::Mat curMask = cv::Mat::zeros(cv::Size(INPUT_W, INPUT_H), CV_8UC1);
		                cv::threshold(maskPart, maskPart, 0.5, 255, cv::THRESH_BINARY);
		                curMask(r) += maskPart;
		                std::vector<std::vector<cv::Point>> contours;
		                cv::findContours(curMask, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_NONE);
				std::vector<rcnn_ros::point> re_con(contours[0].size());
				//本来是把所有图片都处理完再开始画contours的，所以contours设置为一个ecotr，但是这里写在image_callback函数里，每处理一张图片就画一次和发布一次结果，所以其实contour只有一个元素
		                for (int c = 0; c < contours.size(); c++)
				{
					for(int k=0;k<contours[c].size();k++)
					{
						re_con[k].x=contours[c][k].x;
						re_con[k].y=contours[c][k].y;
					}

					cv::drawContours(img, contours, c, cv::Scalar(0, 0, 255));
				}
		                tmp.contours=re_con;
				if(contours.size()!=0)
					cv::imwrite("/home/qudoudou/RC2021/src/rcnn_ros/test/result_"+std::to_string(num)+".jpg",img);
		            }
		             //mask on
				res.push_back(tmp);
		        }
		    }
            rcnn_ros::results Result;
			Result.stamp=msg->color.header.stamp;
			Result.results=res;
			pub.publish(Result);
		}



}

