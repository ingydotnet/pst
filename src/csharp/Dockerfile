ARG FROM
FROM $FROM
ARG TAG

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        mono-complete \
        nuget \
 && wget -nv https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && apt-get install -y gpg \
 && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | \
        gpg --dearmor -o microsoft.asc.gpg \
 && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
 && wget -nv https://packages.microsoft.com/config/ubuntu/22.04/prod.list \
 && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
 && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
 && chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
 && apt-get update \
 && apt-get install -y dotnet-sdk-6.0 \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
