FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ENV DEBIAN_FRONTEND=noninteractive
# Set environment variables for NVIDIA and X11
ENV NVIDIA_DRIVER_CAPABILITIES=all
ENV NVIDIA_VISIBLE_DEVICES=all
ENV QT_X11_NO_MITSHM=1
ENV DISPLAY=:0

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        libglu1-mesa-dev libgl1-mesa-dev libosmesa6-dev libglfw3 \
        unzip patchelf ffmpeg cmake swig mesa-utils tmux htop xvfb
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /workspace

RUN pip install -r requirements.txt

WORKDIR /workspace/rl_libero

CMD ["/bin/bash", "-c", "/workspace/rl_libero/setup_env.sh && /bin/bash"]
