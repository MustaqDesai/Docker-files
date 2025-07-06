# Dockerfile
FROM ubuntu:22.04

# Avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools and PyQt dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-pyqt5 \
    build-essential libgl1-mesa-glx \
    git curl wget nano \
    && apt-get clean

# Set default shell
CMD [ "bash" ]
