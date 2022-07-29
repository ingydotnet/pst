ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL --proto '=https' --tlsv1.2 https://sh.rustup.rs | \
        sh -s -- -y \
 && chmod -R go+rw /root \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
