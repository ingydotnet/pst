ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        octave \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
