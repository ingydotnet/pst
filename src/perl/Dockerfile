ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        cpanminus \
        libnet-ssleay-perl \
        libperl-dev \
        perl \
 && cpanm -n \
        Zilla::Dist \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true

# Install possibly newer Zilla::Dist (after very heavy base is already
# installed):
RUN set -x \
 && touch /stamp \
 && cpanm -n \
        INGY/Zilla-Dist-0.1.11.tar.gz \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
