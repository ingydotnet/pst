ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        ruby \
        ruby-dev \
 && gem install \
      bundler \
      pry \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
