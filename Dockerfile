FROM ubuntu:14.04

ARG DEBIAN_FRONTEND=noninteractive

# Prepare the Build Environment
RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    # from the build instructions
    openjdk-7-jdk \
    bison \
    g++-multilib \
    git-core \
    gperf \
    libxml2-utils \
    make \
    python-networkx \
    zlib1g-dev:i386 \
    zip \
    # Additional dependencies
    unzip \
    curl \
    openssh-client \
    gnupg \
    flex \
    build-essential \
    zlib1g-dev \
    gcc-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    libgl1-mesa-dev \
    xsltproc \
    ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Add unprivileged user
ARG FAIRPHONE_UID
RUN useradd -s /bin/bash -u ${FAIRPHONE_UID:-1000} -U -m fairphone

# Install repo
ARG REPO_VERSION=1.22
ARG REPO_SHA1=da0514e484f74648a890c0467d61ca415379f791
RUN curl https://storage.googleapis.com/git-repo-downloads/repo-${REPO_VERSION} -o /usr/local/bin/repo && \
    echo "${REPO_SHA1} /usr/local/bin/repo" | sha1sum -c && \
    chmod +x /usr/local/bin/repo

# Create working directory
ENV FP_DATA_VOLUME=/var/fairphone_os/
ENV FP_WORKDIR=${FP_DATA_VOLUME}/build
RUN mkdir -p ${FP_WORKDIR} && chown -R fairphone:fairphone ${FP_DATA_VOLUME}
VOLUME ${FP_DATA_VOLUME}
WORKDIR ${FP_DATA_VOLUME}

ENV PATH /opt/helper_scripts:$PATH

USER fairphone
