#!/bin/bash
#
# based on example from laboratories ros_docker script with a docker command:
# docker run --net=host -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/student/ros_workspace/home/student:/home/student ros_orocos/ubuntu:12.04
#
################################################################################
#
# INSTRUCTIONS:
#
# (HERE - refers to the direcotry in which this script exists)
#
# 0. Install docker. This depends on the system, try googling: docker install <YOUR_SYSTEM>
#
# 1. Build the docker image defined in Dockerfile:
#       d ocker build --tag orocos-ros-kinetic .
#
# (2.) This has created a docker image called "orocos-ros-kinetic", to see it, use:
#        docker images
#
# 3. Use this script to start the docker container as follows:
#        ./run-docker-image.sh
#
# 4. This script maps directory HERE/docker-workspace to /workspace inside container.
#    Now we need to create the whole catkin workspace (while being inside docker!), e.g.:
#        mkdir -p /workspace/ros_ws/src/
#        cd /workspace/ros_ws/
#        catkin_make
#
# (5.) Now it is good to add something to bashrc so that we will always source
#    the file devel/setup.bash. The Dockerfile added a line to .bashrc inside
#    the container that will source file /workspace/bashrc if it exists.
#    As /workspace is mapped to HERE/docker-workspace/ on our machine, we can add
#    a file HERE/docker-workspace/bashrc with a line:
#        [[ -f /workspace/ros_ws/devel/setup/bash ]] && source /workspace/ros_ws/devel/setup/bash
#    We can also add other commands/aliases in that bashrc file, as it will
#    persist after exiting docker container.
#
# 6. Now do the task:
#    http://galatea.ict.pwr.wroc.pl/index.php/teaching/12-rpe/7-robotic-programming-environments-lab4
#
################################################################################

CONTAINER_NAME="uav_mavros_simulation-tester"
IMAGE_NAME="uav_mavros_simulation"

docker attach $CONTAINER_NAME
if [ $? -eq 0 ]; then
    exit 0
fi

# xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $CONTAINER_NAME`
# docker start $CONTAINER_NAME
# if [ $? -eq 0 ]; then
#     $0 $1
#     exit 0
# fi

# get this directory's full path
HERE="$(dirname "$(realpath ${BASH_SOURCE[0]})")"
echo "$HERE"

# create the directory that will be mapped into docker image
docker_ws="$HERE/docker-workspace"
mkdir -p "$docker_ws"

# xhost +si:localuser:root
xhost +local:docker
# xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $CONTAINER_NAME`
# run the container that has previously been built from the Dockerfile
#   e.g. with a command:
#       docker build --tag orocos-ros-kinetic:v1 .
# run it in interactive mode, remove everything after exiting, but create a volume
# mapping to local directory
docker run \
    --net=host \
    --tty \
    --interactive \
    --rm \
    --env="DISPLAY=$DISPLAY" \
    -v $XSOCK:$XSOCK \
    -v $HOME/.Xauthority:/root/.Xauthority \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume "$docker_ws:/workspace" \
    --name=$CONTAINER_NAME \
    --privileged \
    -p 127.0.0.1:8080:8080 \
    $IMAGE_NAME \
    bash

# if [ $? -eq 0 ]; then
#         $0 $1
#         exit 0
# fi
# echo "Can't find 'Dockerfile'!"
# exit 1
