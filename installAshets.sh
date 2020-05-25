#!/bin/bash

FIRMDIR=$1
CWD=$PWD
if [[ "$FIRMDIR" == "" ]]; then
  echo "You did not supply the Firmware folder."
  exit
fi

cd $FIRMDIR

echo "installing launch files."
cp $CWD/launch/new_posix_sitl.launch launch/ -v

echo "installing Gazebo Models."
cp -r $CWD/models/aruco_marker Tools/sitl_gazebo/models/ -v
cp -r $CWD/models/iris_fpv_down_cam.sdf Tools/sitl_gazebo/models/iris_fpv_cam/ -v

echo "installing worlds."
cp $CWD/worlds/* Tools/sitl_gazebo/worlds/ -v

echo "installing camera parameters"
cp $CWD/scripts/1018_iris_fpv_cam ROMFS/px4fmu_common/init.d-posix/ -v