ARG FROM
FROM $FROM
ARG TAG

RUN bpan_version=0.1.107 \
 && set -x \
 && touch /stamp \
 && git clone --branch=main https://github.com/bpan-org/bpan /root/.bpan \
 && chmod -R go+rw /root/.bpan \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
