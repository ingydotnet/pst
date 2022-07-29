ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://deno.land/x/install/install.sh | sh \
 && chmod -R go+rw /root \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
