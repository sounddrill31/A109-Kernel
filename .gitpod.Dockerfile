FROM accupara/ubuntu:14.04

ENV YQ_VER=4.40.3

RUN set -x \
 && sudo dpkg --add-architecture i386 \
 && sudo apt-get update \
 && sudo apt-get -y install \
    bc \
    bison \
    # brotli \
    build-essential \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    gnupg \
    gperf \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    libc6:i386 \
    libelf-dev \
    liblz4-tool \
    libncurses5:i386 \
    libncurses5-dev \
    libncurses5 \
    libfreetype6 \
    libgl1-mesa-dev \
    libsdl1.2-dev \
    libssl-dev \
    libstdc++6:i386 \
    libwxgtk2.8-dev \
    libx11-dev \
    libxml2 \
    libxml2-utils \
    lzop \
    m4 \
    openjdk-6-jdk \
    pngcrush \
    schedtool \
    squashfs-tools \
    unzip \
    x11proto-core-dev \
    xsltproc \
    zip \
    zlib1g-dev \
# Add the yq tool from the releases at https://github.com/mikefarah/yq
 && wget -q -O yq https://github.com/mikefarah/yq/releases/download/v${YQ_VER}/yq_linux_amd64 \
 && chmod +x yq \
 && sudo mv yq /usr/bin/ \
# Final cleanups
 && sudo apt-get clean \
 && sudo rm -f /var/lib/apt/lists/*_dists_*

ENV REPO_NO_INTERACTIVE=1 \
    GIT_TERMINAL_PROMPT=0


# Create the gitpod user. UID must be 33333.
RUN sudo useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
