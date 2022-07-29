ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && wget -nv https://download.racket-lang.org/installers/8.5/racket-8.5-x86_64-linux-cs.sh \
 && (echo yes; echo 2; echo) | \
        sh racket-8.5-x86_64-linux-cs.sh \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
