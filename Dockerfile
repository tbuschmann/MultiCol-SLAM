FROM phusion/baseimage
LABEL maintainer "tim@buschmann-ge.de" 

RUN apt-get update -y

#Install Depends
RUN apt-get install -y git gcc g++ cmake libglew-dev libpython2.7-dev

#Pangolin
RUN apt-get install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev && \
	apt-get install -y libjpeg-dev libpng12-dev libtiff5-dev libopenexr-dev libgl1-mesa-dri 	 

RUN git clone https://github.com/stevenlovegrove/Pangolin.git && \
cd Pangolin && \
mkdir build && \
cd build && \
cmake .. && \
make -j 2

#OpenCV
RUN apt-get install -y libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

RUN git clone https://github.com/Itseez/opencv.git && \

cd opencv && \
mkdir build && \
cd build && \
cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_CUDA=OFF .. && \
make -j 4 && \
make install

# Build MultiCol-SLAM
COPY . source/multicol-slam
WORKDIR source/multicol-slam
RUN chmod +x build.sh && sh build.sh

# clean up Image
