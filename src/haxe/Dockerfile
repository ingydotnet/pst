ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && cd /usr/local \
 && touch /stamp \
 && curl -fsSL https://github.com/HaxeFoundation/neko/releases/download/v2-3-0/neko-2.3.0-linux64.tar.gz | tar xz \
 && curl -fsSL https://github.com/HaxeFoundation/haxe/releases/download/4.2.5/haxe-4.2.5-linux64.tar.gz | tar xz \
 && mv haxe_20* haxe-4.2.5 \
 && export NEKOPATH=/usr/local/neko-2.3.0-linux64 \
 && export HAXE_STD_PATH=/usr/local/haxe-4.2.5/std \
 && export PATH=/usr/local/haxe-4.2.5:/usr/local/neko-2.3.0-linux64:$PATH \
 && export LD_LIBRARY_PATH=/usr/local/neko-2.3.0-linux64:$LD_LIBRARY_PATH \
 && haxelib setup /root/.haxe/lib \
 && chmod -R go+rw /root \
 && find /usr /etc /root -cnewer /stamp | cpio -dump /export \
 && true
