ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y gnat \
 && wget -nv https://github.com/alire-project/alire/releases/download/v1.2.1/alr-1.2.1-bin-x86_64-linux.zip \
 && unzip alr-*-bin-x86_64-linux.zip \
 && mv bin/alr /usr/local/bin \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
