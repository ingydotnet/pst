ARG FROM
FROM $FROM
ARG TAG

RUN set -x \
 && touch /stamp \
 && wget -nv https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
 && dpkg -i erlang-solutions_2.0_all.deb \
 && apt-get update --allow-insecure-repositories \
 && apt-get install -y \
        elixir \
        erlang-dev \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true
