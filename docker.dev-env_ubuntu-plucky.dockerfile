ARG arch=amd64
FROM --platform=linux/${arch} ubuntu:plucky

WORKDIR /MyProjects

# Install dependancies
RUN apt-get update && apt-get install -y \
    python3-full python3-pip python3-pytest \
    zsh git curl wget \
    build-essential libgl1-mesa-glx \
    nano locales \
    nodejs, npm \
    && apt-get clean

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0

# Install PyQt6
RUN pip3 install --upgrade pip && \
    pip3 install PyQt6
    
# Set zsh as default shell
SHELL ["/usr/bin/zsh", "-c"]
CMD ["zsh"]

# docker image build --tag img-my-dev-env-plucky -f my-dev-env_ubuntu-plucky.Dockerfile .
# docker run -it --name cntMyDevEnv --volume volumeMyProjects:/MyProjects --privileged img-my-dev-env /bin/bash 
# docker run -it --name cntMyDevEnvPlucky --volume volumeMyProjects:/MyProjects --privileged img-my-dev-env-plucky /bin/bash 
