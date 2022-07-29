ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && curl -fsSL \
        https://dl.cloudsmith.io/public/nxadm-pkgs/rakudo-pkg/setup.deb.sh | \
        perl -pe 's/(apt-get update)/$1 --allow-insecure-repositories/' | \
        bash \
 && apt-get install rakudo-pkg \
 && perl -pi -e 's{(bin/zef)}{$1 --/test}' \
        /opt/rakudo-pkg/bin/install-zef \
 && /opt/rakudo-pkg/bin/install-zef \
 && export PATH=/root/.raku/bin:/opt/rakudo-pkg/bin:$PATH \
 && zef install \
        App::Prove6 \
        Terminal::LineEditor \
        Test::META \
        fez \
 && chmod -R go+rw /root \
 && find /opt /etc /root -cnewer /stamp | cpio -dump /export \
 && true
