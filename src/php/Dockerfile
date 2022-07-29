ARG FROM
FROM $FROM
ARG TAG

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && apt-get update --fix-missing \
 && touch /stamp \
 && apt-get install -y \
        php \
        php-curl \
 && curl -fsSL https://getcomposer.org/installer \
        -o /tmp/composer-setup.php \
 && php /tmp/composer-setup.php \
        --install-dir=/usr/local/bin \
        --filename=composer \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true

RUN set -x \
 && cp -rd /etc/php /export/etc/php \
 && true
