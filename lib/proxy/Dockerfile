FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && apt-get update \
 && apt-get install -y squid-deb-proxy \
 && rm -rf /var/lib/apt/lists/* \
 && true

RUN set -x \
 && ln -sf /data /var/cache/squid-deb-proxy \
 && ln -sf /dev/stdout /var/log/squid-deb-proxy/access.log \
 && ln -sf /dev/stdout /var/log/squid-deb-proxy/store.log \
 && ln -sf /dev/stdout /var/log/squid-deb-proxy/cache.log \
 && true

VOLUME ["/data"]
EXPOSE 8000

ADD entrypoint.bash /entrypoint.sh
CMD ["/entrypoint.sh"]
