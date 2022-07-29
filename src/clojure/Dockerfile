ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        clojure \
        default-jdk \
        default-jre \
 && curl -fsSL \
        https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
        -o /usr/local/bin/lein \
 && chmod +x /usr/local/bin/lein \
 && lein --help \
 && chmod -R go+rw /root \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
