ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && apt-get install -y \
        apt-utils \
 && apt-get install -y \
        apt-file \
        apt-transport-https \
        autoconf \
        automake \
        bash \
        build-essential \
        cpio \
        curl \
        default-jdk \
        dialog \
        git \
	iputils-ping \
        libtool \
        pkgconf \
        unzip \
        wget \
        zip \
 && true
