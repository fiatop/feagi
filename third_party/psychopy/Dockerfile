FROM dorowu/ubuntu-desktop-lxde-vnc

RUN locale  # check for UTF-8
RUN sudo apt update && sudo apt install locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale  # verify settings
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
RUN sudo apt update
RUN sudo apt install ros-foxy-ros-base -y
RUN apt install -y ros-foxy-ros-ign-bridge
RUN apt install -y ros-foxy-ros-ign-image
RUN apt install -y wmctrl
RUN apt install -y python3-pip
RUN pip3 install opencv-python
RUN pip3 install feagi-agent
RUN sudo apt install libignition-gazebo3-dev -y \
        lsb-release \
        wget \
        git \
        python3-zmq \
        xterm \
        unzip \
        python3-colcon-common-extensions \
        build-essential \
        cmake \
        git

ENV GAZEBO_CONTAINER=true
ENV OPENBOX_ARGS='--startup "/opt/source-code/simulation/start_controller.sh"'

RUN apt install -y wmctrl
RUN apt install -y python3-pip
RUN pip3 install opencv-python
RUN pip3 install feagi-agent

WORKDIR /etc/xdg/openbox
RUN sed -i "s|<number>4</number>|<number>1</number> |g" rc.xml
RUN mkdir -p /opt/source-code/simulation
WORKDIR /opt/source-code/simulation
COPY ./ ./
COPY gazebo.png /usr/local/share/doro-lxde-wallpapers/bg1.jpg
RUN chmod a+x ./start_controller.sh
RUN chmod 0755 /opt/source-code/simulation


