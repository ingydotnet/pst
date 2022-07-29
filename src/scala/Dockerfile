ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && curl -fsSL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | \
        gzip -d > cs \
 && chmod +x cs \
 && ./cs setup -y \
 && cd /root \
 && rm /root/.profile \
 && export PATH=/root/.local/share/coursier/bin:$PATH \
 && sbt --version \
 && chmod -R go+rw /root \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
