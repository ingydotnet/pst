ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        python3 \
        python3-pip \
        python3.10-venv \
 && ln -s python3.10 /usr/bin/python \
 && pip install \
	twine \
 && find /usr -cnewer /stamp | cpio -dump /export \
 && true
