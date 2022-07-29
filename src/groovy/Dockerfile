ARG FROM
FROM $FROM
ARG TAG

SHELL [ "bash", "-c" ]

RUN set -x \
 && touch /stamp \
 && curl -fsSL get.sdkman.io | bash \
 && source ~/.sdkman/bin/sdkman-init.sh \
 && sdk install groovy \
 && chmod -R go+rw /root \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
