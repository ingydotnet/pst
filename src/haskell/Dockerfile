ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        haskell-platform \
 && ( \
        find /usr /etc -cnewer /stamp; \
        find /var/lib/ghc/package.conf.d; \
    ) | cpio -dump /export \
 && true
