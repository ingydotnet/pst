ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        bash \
 && git clone https://github.com/bpan-org/bpan /root/.bpan \
 && chmod -R go+rw /root/.bpan \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
