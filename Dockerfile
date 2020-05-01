FROM node:12

USER root
RUN apt-get update \
    && apt-get -y install build-essential \
    && apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    && wget -O opencv.zip https://github.com/opencv/opencv/archive/4.3.0.zip \
    && unzip opencv.zip \
    && mkdir -p opencv-4.3.0/build && cd opencv-4.3.0/build \
    && cmake -D CMAKE_BUILD_SAMPLE=OFF -D CMAKE_BUILD_TEST=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j7 \
    && make install \
    && cd ../../ \
    && rm opencv.zip \
    && rm -rf ./opencv-4.3.0
