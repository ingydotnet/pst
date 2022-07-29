ARG FROM
FROM $FROM
ARG TAG

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        clang \
        clang-tools \
        gnustep \
        gnustep-devel \
        gobjc \
        libclang-14-dev \
        libclang-common-14-dev \
 && touch -h /usr/bin/clang \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        ruby \
        ruby-dev \
 && gem install cocoapods \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
