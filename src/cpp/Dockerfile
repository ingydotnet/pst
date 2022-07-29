ARG FROM
FROM $FROM
ARG TAG

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        gcc \
        gradle \
        python3 \
        python3-pip \
        python3.10-venv \
 && pip install conan \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
