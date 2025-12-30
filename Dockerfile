FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

# Install essential packages 
RUN apt update && apt upgrade -y && apt install -y sudo \
    build-essential chrpath cpio debianutils diffstat file gawk gcc git \
    iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 \
    python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

# Let ubuntu user use sudo without password
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set working directory and switch to non-root user
USER ubuntu
WORKDIR /home/ubuntu/yocto-project