ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && cd /tmp \
 && curl -fsSL https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz | tar xz \
 && mv julia-1.8.0 /usr/local/ \
 && ln -s /usr/local/julia-1.8.0/bin/julia /usr/local/bin/julia \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
