ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | \
        gpg --dearmor -o /usr/share/keyrings/dart.gpg \
 && echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64]' \
        https://storage.googleapis.com/download.dartlang.org/linux/debian \
        stable main \
            > /etc/apt/sources.list.d/dart_stable.list \
 && apt-get update \
 && apt-get install -y \
        dart \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
