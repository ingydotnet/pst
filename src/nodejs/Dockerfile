ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        nodejs \
        npm \
 && cd /root \
 && npm install \
        coffeescript \
        typescript \
 && chmod -R go+rw /root/node_modules \
 && find /usr /root -cnewer /stamp | cpio -dump /export \
 && true
