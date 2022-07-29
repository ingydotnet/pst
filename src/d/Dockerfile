ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://dlang.org/install.sh | \
        bash -s dmd \
 && find /root/dlang -type d | \
        xargs chmod go+rwx \
 && find /root/dlang -type f | \
        xargs chmod go+rw \
 && chmod -R go+rw /root/dlang \
 && find /root/dlang | cpio -dump /export \
 && true
