#include "ros/ros.h"
#include"mv_driver/raw_img.h"
#include<cv_bridge/cv_bridge.h>
#include<sensor_msgs/Image.h>

#include <iostream>
#include<string>
#include <math.h>

//lib
#include <librealsense2/rs.hpp>
#include<librealsense2/rsutil.h>
#include <librealsense2/hpp/rs_processing.hpp>
#include <librealsense2/hpp/rs_types.hpp>
#include <librealsense2/hpp/rs_sensor.hpp>

#include <opencv2/opencv.hpp>


//pcl
// PCL 库


using namespace std;

using namespace cv;

// 相机内参
const double camera_factor = 1000;
const double camera_cx = 311.704;
const double camera_cy = 245.82;
const double camera_fx = 474.055;
const double camera_fy = 474.055;

//
ros::Publisher img_pub;
mv_driver::raw_img img_msg;
Mat depth;

//rs2::frameset frame_set;


rs2_intrinsics intrinDepth,intrinColor;


void get_img(ros::NodeHandle nh)
{
	rs2::pipeline pipe;     //Contruct a pipeline which abstracts the device
	rs2::config cfg;    //Create a configuration for configuring the pipeline with a non default profile

	cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 30);
	cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);

	rs2::pipeline_profile selection = pipe.start(cfg);
	rs2_stream align_to = RS2_STREAM_COLOR;
	rs2::align align(align_to);

	while(ros::ok())
	{
		rs2::frameset frames;
		frames = pipe.wait_for_frames();

		auto processed = align.process(frames);
		
		//Get each frame
		auto color_frame = processed.get_color_frame();
		auto depth_frame = processed.get_depth_frame();

		//create cv::Mat from rs2::frame
		Mat depth_;
		Mat color(Size(640, 480), CV_8UC3, (void*)color_frame.get_data(), Mat::AUTO_STEP);
		Mat deep(Size(640, 480), CV_16UC1, (void*)depth_frame.get_data(), Mat::AUTO_STEP);
	
		Mat dst3(Size(640, 480), CV_16UC1);
		ushort* p;
		ushort* q;

		//float scale = frames.get_depth_scale();
		for (int y = 0; y < 480; y++)
		{
			q = deep.ptr<ushort>(y);
			for (int x = 0; x < 640; x++)
			{
				//dst->imageData[y * depth_info.height + x] = depth__data[y * depth_info.height + x];
				ushort d = 0.125 * q[x];
				//cout << "d:  " << d << endl;
				p = dst3.ptr<ushort>(y);

				//距离在0.2m至1.2	int k = 0;m之间

				if (d > 0)
				{
					p[x] = 255 - 0.255 * (d - 200);
					//cout << "p:  " << p[x] << endl;
				}
				else
					p[x] = 0;
			}
		}
		dst3.convertTo(depth_, CV_8UC1, 1);
	
		//  imshow("Display Image", color);
		// waitKey(1);
		// imshow("Display deep", depth_);
		// waitKey(1);

		sensor_msgs::ImagePtr color_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", color).toImageMsg();
   		color_msg->header.stamp = ros::Time::now();
		sensor_msgs::ImagePtr depth_msg = cv_bridge::CvImage(std_msgs::Header(), "mono8", depth_).toImageMsg();
    	depth_msg->header.stamp = ros::Time::now();
    	img_msg.color = *color_msg;
		img_msg.depth = *depth_msg;
	
		img_pub.publish(img_msg);
		//cout<<"pub img!"<<endl;
	}
}





int main (int argc, char** argv)
{
    //初始化节点
    ros::init(argc, argv, "mv_driver_node");
    //声明节点句柄
    ros::NodeHandle nh;
	img_pub=nh.advertise<mv_driver::raw_img>("/raw_img",10);
	ros::Duration(1).sleep();
	while(ros::ok())
		get_img(nh);
	nh.shutdown();
}
