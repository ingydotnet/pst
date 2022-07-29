ARG FROM
FROM $FROM
ARG TAG

# ARG DEBIAN_FRONTEND=noninteractive

# SHELL [ "bash", "-c" ]

RUN set -x \
 && cd /tmp \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        foo \
 && curl -fsSL https://example.com/foo | tar xz \
 && chmod -R go+rw /root \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
