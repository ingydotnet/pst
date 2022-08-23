ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && git clone --branch=main https://github.com/bpan-org/bpan /root/.bpan \
 && chmod -R go+rw /root/.bpan \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
