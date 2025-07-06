# pytorch/pytorch has Python 3.10.13, PyTorch 2.2.1, and conda. 
# Tensorboard may need to be installed with conda, but still may not work.
FROM pytorch/pytorch
#
#FROM pytorch/pytorch:2.7.1-cuda11.8-cudnn9-devel

# Need to resove issue with bulding with ubuntu.
# FROM ubuntu:22.04

# Python 3.12 works with TensorBoard, Python 3.13 is not compatible with TensorBaord.
# Python 3.14-rc takes very long to build.
# FROM python:3.14-rc
# FROM intel/intel-extension-for-pytorch:2.7.10-xpu
# FROM intel/intel-optimized-pytorch:2.7.10-xpu

# Debian needs to install Python with apt. Debian Trixie does not find Python3.12
# FROM debian:bookworm

# FROM ubuntu:25.10

ENV DEBIAN_FRONTEND=noninteractive

# GUI support for macOS using XQuartz
# Install XQuartz on Mac and https://www.google.com/search?q=x11+docker+container
# Also look into https://github.com/mviereck/x11docker
ENV DISPLAY=host.docker.internal:0

# Set UTF-8 locale
# RUN apt-get update && apt-get install -y locales && \
#     locale-gen en_US.UTF-8
# ENV LANG=en_US.UTF-8
# ENV LANGUAGE=en_US:en
# ENV LC_ALL=en_US.UTF-8

# Install tzdata (for Debian-based images)
RUN apt-get update && apt-get install -y tzdata
# Set the timezone
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system packages, libx11-dev and python3-tk to show plot graph on Mac host.
# python3 python3-pip python3-venv
RUN apt-get update && apt-get install -y \
    bzip2 ca-certificates zsh git curl wget \
    python3-tk libx11-dev \
    && apt-get clean

# Download Miniconda installer
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh

# Install Miniconda
# RUN bash /tmp/miniconda.sh -b -p /opt/miniconda

# Update the PATH environment variable
# ENV PATH="/opt/miniconda/bin:$PATH"

# Clean up installer
# RUN rm /tmp/miniconda.sh

# Ensure Conda is updated
# RUN conda update -n base -c defaults conda

# Install Python libraries
# Create a virtual environment at /opt/venv
# RUN python3 -m venv /opt/venv
# Add the virtual environment's bin directory to the PATH
# ENV PATH="/opt/venv/bin:$PATH"  
# RUN pip install --root-user-action=ignore --break-system-packages matplotlib mlxtend numpy pandas requests scikit-learn tensorboard torch-tb-profiler torchinfo tqdm
# RUN pip install matplotlib mlxtend numpy pandas requests scikit-learn 
# RUN pip install tensorboard torch-tb-profiler torchinfo tqdm

# Install PyTorch CPU-only version
# Use the official PyTorch download URL for CPU wheels
# RUN pip install torch torchaudio torchmetrics torchvision --index-url https://download.pytorch.org/whl/cpu

# Set working directory to match host project folder
WORKDIR /root/project

# Set Zsh as default shell
SHELL ["/usr/bin/zsh", "-c"]

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

CMD ["zsh"]

