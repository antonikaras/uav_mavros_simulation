# uav mavros simulation

## Description 

This package was developed as part of the course Introduction to UAS technology at the University of  Southern Denmark. The goal is to land the drone to an ArUCO marker. The drone is simulated using SITL and PX4. 

A video demonstation of the system is here :  https://youtu.be/k1WqiE6d8TA 

The branch docker_env contains a docker environment, without the neeed to install ROS in your system, with instructions on how to run it. 

## Dependencies

* ROS, tested on ros-melodic
* the mavros package v1.10.2, https://dev.px4.io/master/en/ros/mavros_installation.html
* QGroundControl, http://qgroundcontrol.com/
* the simple_pid python package, ```pip install simple-pid```
* PX4 firmware, tested on version v1.10.2, ``` git clone https://github.com/px4/firmware```

## Instructions

* Clone the package your catkin_workspace/src, ``` git clone https://github.com/antonikaras/uav_mavros_simulation.git ```
* ```./installAshets.sh PX4_dir```, PX4_dir is the directory you cloned the PX4 firmware
* Add the location of the px4 firmware to the file /launch/uav_launch.launch, firm_dir
* catkin build/ catkin_make 
* source devel/setup.bash
* ``` roslaunch uav_mavros_simulation uav_launch.launch world:=aruco vehicle:=iris_fpv_cam sdf:=iris_fpv_down_cam ```
* ``` rosrun uav_mavros_simulation simpleDrone.py ```
* run QGroundControl

## UAV commander instructions

* exit, to close the swarm commander
* goto x y z yaw, uav will go to the  specified location location
    *  examp1es : ```goto -46 15 13 1.5 ```, ```goto aruco ```
* land [x y z yaw] -> uav will land at its current position or at the optional x, y, z, yaw, or at the aruco marker
    * examples : ```land ```, ```land 1 5 5 1.2 ```, ```land aruco```
* return -> uav will return to its home position and land
    * example : ``` return ```   
