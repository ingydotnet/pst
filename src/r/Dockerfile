ARG FROM
FROM $FROM
ARG TAG

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && touch /stamp \
 && curl -fsSL \
        https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
        gpg --dearmor -o /usr/share/keyrings/r-project.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | \
        tee -a /etc/apt/sources.list.d/r-project.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        r-base \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
