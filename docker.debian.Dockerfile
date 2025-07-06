# With Debian, need to install Python with apt. 
# Debian Trixie installs Python 3.13, which does not work does not with TensorBoard.
# Debian Bookwork installs Python 3.11, which does work with TensorBoard.
FROM debian:bookworm

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
    python3 python3-pip python3-venv \
    python3-tk libx11-dev \
    && apt-get clean

# Install Python libraries
# Create a virtual environment at /opt/venv
RUN python3 -m venv /opt/venv
# Add the virtual environment's bin directory to the PATH
ENV PATH="/opt/venv/bin:$PATH"  
# RUN pip install --root-user-action=ignore --break-system-packages matplotlib mlxtend numpy pandas requests scikit-learn tensorboard torch-tb-profiler torchinfo tqdm
RUN pip install matplotlib 
RUN pip install mlxtend 
RUN pip install numpy 
RUN pip install pandas 
RUN pip install requests 
RUN pip install scikit-learn 
RUN pip install tensorboard 
RUN pip install torch-tb-profiler 
RUN pip install torchinfo 
RUN pip install tqdm

# Install PyTorch CPU-only version
# Use the official PyTorch download URL for CPU wheels
RUN pip install torch torchaudio torchmetrics torchvision --index-url https://download.pytorch.org/whl/cpu

# Set working directory to match host project folder
WORKDIR /root/project

# Set Zsh as default shell
SHELL ["/usr/bin/zsh", "-c"]

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

CMD ["zsh"]

