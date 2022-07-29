ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        nodejs \
        npm \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
