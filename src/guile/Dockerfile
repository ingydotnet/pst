ARG FROM
FROM $FROM
ARG TAG

SHELL [ "bash", "-c" ]

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        guile-3.0 \
 && (echo; echo yes; echo yes; echo yes) | \
        bash <(curl -fsSL https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh) \
 && touch -h /root/.config/guix/current \
 && chmod -R go+rw /root/.config \
 && find /var/guix /gnu/store | cpio -dump /export \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
