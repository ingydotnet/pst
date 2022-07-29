ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && cd /tmp/ \
 && curl -fsSL https://www.lua.org/ftp/lua-5.4.4.tar.gz | tar xz \
 && make -C lua-5.4.4/ linux install \
 && curl -fSSL https://luarocks.org/releases/luarocks-3.9.1.tar.gz | tar xz \
 && cd luarocks-3.9.1/ \
 && ./configure \
 && make \
 && make install \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
