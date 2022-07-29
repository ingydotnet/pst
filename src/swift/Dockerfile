ARG FROM
FROM $FROM
ARG TAG

# See https://www.swift.org/download/#linux for possibly better install
# instructions. Doesn't explicitly support ubuntu 22.04 yet though.

RUN set -x \
 && cd /tmp \
 && curl -fsSL https://download.swift.org/development/ubuntu2204/swift-DEVELOPMENT-SNAPSHOT-2022-08-09-a/swift-DEVELOPMENT-SNAPSHOT-2022-08-09-a-ubuntu22.04.tar.gz | tar xz \
 && cd swift-DEVELOPMENT-SNAPSHOT-2022-08-09-a-ubuntu22.04/ \
 && find . | cpio -dump /export \
 && true
