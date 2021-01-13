#!/bin/bash

# Update the firmware directory
cd docker-workspace/Firmware
git checkout tags/v1.11.1
git submodule update --init --recursive

