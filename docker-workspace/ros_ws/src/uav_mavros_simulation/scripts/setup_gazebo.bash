#!/bin/bash

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/workspace/Firmware
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/workspace/Firmware/Tools/sitl_gazebo

source /workspace/Firmware/Tools/setup_gazebo.bash /workspace/Firmware /workspace/Firmware/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/workspace/Firmware:/workspace/Firmware/Tools/sitl_gazebo
export GAZEBO_MODEL_PATH=/workspace/ros_ws/src/uav_mavros_simulation/models:$GAZEBO_MODEL_PATH

echo ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH
