FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

SHELL ["/bin/bash", "-c"]

RUN apt-get clean && \
    apt-get autoclean
COPY ./sources.list /etc/apt/

RUN apt-get update  && apt-get upgrade -y  && \
    apt-get install -y \
    htop \
    apt-utils \
    curl \
    cmake \
    git \
    openssh-server \
    build-essential \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools \
    libboost-all-dev \
    net-tools \
    vim \
    stress 

RUN apt-get install -y libc-ares-dev libssl-dev gcc g++ make 

RUN apt-get install -y  \
    libx11-xcb1 \
    libfreetype6 \
    libdbus-1-3 \
    libfontconfig1 \
    libxkbcommon0   \
    libxkbcommon-x11-0

RUN apt-get install -y python-dev \
    python3-dev \
    python-pip \
    python-all-dev 


COPY ./source/abseil /tmp/source/abseil
RUN /tmp/source/abseil/install_abseil.sh


COPY ./source/protobuf /tmp/source/protobuf
RUN /tmp/source/protobuf/install_protobuf.sh


COPY ./source/grpc /tmp/source/grpc
RUN /tmp/source/grpc/install_grpc.sh




