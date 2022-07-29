ARG FROM
FROM $FROM
ARG TAG

SHELL [ "bash", "-c" ]

RUN set -x \
 && touch /stamp \
 && sh <(curl -fsSL https://nim-lang.org/choosenim/init.sh) -y \
 && chmod -R go+rw /root \
 && chmod go+x /root/.nimble/bin/* \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
