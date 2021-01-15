# uav mavros simulation

## Description 

This package was developed as part of the course Introduction to UAS technology at the University of  Southern Denmark. The goal is to land the drone to an ArUCO marker. The drone is simulated using SITL and PX4. 

A video demonstation of the system is here :  https://youtu.be/k1WqiE6d8TA 

The branch docker_env contains a docker environment, without the neeed to install ROS in your system, with instructions on how to run it. 

## Dependencies

* px4 firmware v1.10.2, git clone https://github.com/px4/firmware
* QGroundControl, http://qgroundcontrol.com/

## How to install

* Clone the package your using ```git clone -b docker_env https://github.com/antonikaras/uav_mavros_simulation```

### Install docker

* Docker without Nvidia graphics card https://docs.docker.com/engine/install/ubuntu/
* Docker with Nvidia graphics card https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
* It can be benificial to add your user to the docker group such that sudo is not needed to run docker commands.
``` 
    sudo groupadd docker
    sudo usermod -aG docker $USER
    and reboot the computer
```

* Build the Docker image in the root directory of this git repo:
    
    ```docker build --tag uav_mavros_simulation .```

### Install the PX4 Firmware

* Download the PX4 firmware repo version and select version v1.8.2.
```    
    cd docker-workspace
    git clone https://github.com/PX4/Firmware.git
    cd Firmware
    git checkout tags/v1.10.2
    git submodule update --init --recursive
```

* And run the docker image with:
	```./run-docker-image.sh or ./run-docker-image-gpu.sh```

* Now build the PX4 firmware inside the Docker image according to the guide.
```
    ./run-docker-image.sh or ./run-docker-image-gpu.sh
    cd /workspace/Firmware
    DONT_RUN=1 make px4_sitl_default gazebo        
```

## How to use

* Terminal 1:
```
    ./run-docker-image.sh or ./run-docker-image-gpu.sh
    build-ws
    roslaunch uav_mavros_simulation uav_launch.launch
```
* Terminal 2
```
    docker exec -it uav_mavros_simulation-tester bash
    src
    rosrun uav_mavros_simulation simpleDrone.py
```
* Terminal 3
    run QGroundControl, it is used to visualize the UAVs, create missions, etc...

## UAV commander instructions

* exit, to close the swarm commander
* goto x y z yaw, uav will go to the  specified location location
    *  examples : ```goto -46 15 13 1.5 ```, ```goto aruco ```
* land [x y z yaw] -> uav will land at its current position or at the optional x, y, z, yaw, or at the aruco marker
    * examples : ```land ```, ```land 1 5 5 1.2 ```, ```land aruco```
* return -> uav will return to its home position and land
    * example : ``` return ```   
