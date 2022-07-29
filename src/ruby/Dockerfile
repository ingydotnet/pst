ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        ruby \
        ruby-dev \
 && gem install bundler \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
