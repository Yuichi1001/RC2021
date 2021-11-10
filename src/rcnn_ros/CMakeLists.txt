cmake_minimum_required(VERSION 3.0.2)
project(rcnn_ros)


add_definitions(-std=c++11)

option(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE Debug)

set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS};--extended-lambda)

find_package(CUDA REQUIRED)

# cuda
include_directories(/usr/local/cuda-10.2/include)
link_directories(/usr/local/cuda-10.2/lib64)
# tensorrt
include_directories(/home/qudoudou/TensorRT-7.2.1.6/include)
link_directories(/home/qudoudou/TensorRT-7.2.1.6/lib)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Ofast -Wfatal-errors -D_MWAITXINTRIN_H_INCLUDED")

cuda_add_library(myplugins SHARED src/BatchedNms.cu src/PredictorDecode.cu src/RoiAlign.cu src/RpnDecode.cu src/RpnNms.cu src/MaskRcnnInference.cu)


find_package(
  catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  cv_bridge
  image_transport 
  mv_driver 
)

add_message_files(
  FILES
  detection.msg
  results.msg
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

find_package(OpenCV 4 REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(${PROJECT_NAME}_node src/rcnn.cpp)

target_link_libraries(${PROJECT_NAME}_node
  ${catkin_LIBRARIES}
  nvinfer
  cudart
  myplugins
  ${OpenCV_LIBS}
)



add_definitions(-O2 -pthread)

