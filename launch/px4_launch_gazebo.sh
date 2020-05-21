#! /bin/bash

# Export the desired gps coordinates
export PX4_HOME_LAT=55.47197622
export PX4_HOME_LON=10.32480953
export PX4_HOME_ALT=7.4000000

# Source the PX4 Firmware directory
if [ -z "$1"]; then
# change this to a location of your firmware! 
FIRMDIR="/home/antony/Documents/Git/Firmware"
else
FIRMDIR=$1
fi
echo $FIRMDIR

# source ros - remeber to change to your version, e.g. melodic/kinetic
source /opt/ros/melodic/setup.bash
# argument used to browse to your PX4 SITL firmware folder
cd $FIRMDIR

# Needed environment for running SITL
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

# Run basic PX4 SITL
roslaunch px4 posix_sitl.launch