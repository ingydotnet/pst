ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        opam \
 && opam init --auto-setup --disable-sandboxing \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
