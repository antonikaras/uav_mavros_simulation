# use docker image for ros kinetic with most needed features
FROM osrf/ros:melodic-desktop-full-bionic

# install needed packages: the orocos and some text editors
RUN apt-get update && apt-get install -y \
    ros-melodic-mavros \
    ros-melodic-mavros-extras \
    astyle \
    build-essential \
    ccache \ 
    clang \
    clang-tidy \
    cmake \
    cppcheck \
    doxygen \
    file \
    g++ \
    gcc \
    gdb \
    git \
    lcov \
    make \
    ninja-build \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python-catkin-tools \
    rsync \
    shellcheck \
    unzip \
    xsltproc \
    zip \
    libeigen3-dev \
    libopencv-dev \
    libroscpp-dev \
    protobuf-compiler \
    python-pip \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    libgstreamer-plugins-base1.0-dev \
    libgstrtspserver-1.0-dev \
    xvfb \
    iputils-ping \
    nano vim \
	&& rm -rf /var/lib/apt/lists/

# make bash automatically source our custom bashrc that we will put
# inside our volume
RUN echo '\n\n[[ -f /workspace/bashrc ]] && source /workspace/bashrc' >> $HOME/.bashrc

RUN pip install --user argparse cerberus empy jinja2 numpy packaging pandas psutil pygments pyros-genmsg pyserial pyulog pyyaml setuptools six toml wheel rosdep utm simple-pid
RUN pip3 install --user --upgrade empy jinja2 numpy packaging pyros-genmsg toml pyyaml pymavlink \
	rospkg netifaces

COPY ./docker-workspace/install_geographiclib_datasets.sh / 
RUN chmod +x /install_geographiclib_datasets.sh && /install_geographiclib_datasets.sh

RUN apt-get update && apt-get upgrade -y
