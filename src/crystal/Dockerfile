ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://crystal-lang.org/install.sh | bash \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
