FROM gibibit/debian-cpp:stretch
MAINTAINER Colin Bennett <colin@gibibit.com>
ARG DEBIAN_FRONTEND=noninteractive
COPY dpkg-nodoc.conf /etc/dpkg/dpkg.conf.d/01_nodoc
COPY remove-docs.sh /tmp/remove-docs.sh
# We give --no-install-recommends since 'git' pulls in
# the ssh-client package which pulls in a ton of X11 packages
# as recommended dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
        bc \
        cpio \
        curl \
        device-tree-compiler \
        file \
        git \
        libncurses5-dev \
        python \
        rsync \
        ssh-client \
        unzip \
        wget \
        xz-utils \
    && sh /tmp/remove-docs.sh \
    && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*
