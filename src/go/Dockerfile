ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://go.dev/dl/go1.18.4.linux-amd64.tar.gz | \
        tar -C /usr/local -xz \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
