# Base ARG variables:
ARG BASE_NAME
ARG BASE_IMAGE

# Images to COPY runtime files from:
FROM $BASE_NAME-ada         AS ada
FROM $BASE_NAME-bash        AS bash
FROM $BASE_NAME-clisp       AS clisp
FROM $BASE_NAME-clojure     AS clojure
FROM $BASE_NAME-cpp         AS cpp
FROM $BASE_NAME-crystal     AS crystal
FROM $BASE_NAME-csharp      AS csharp
FROM $BASE_NAME-d           AS d
FROM $BASE_NAME-dart        AS dart
FROM $BASE_NAME-denojs      AS denojs
FROM $BASE_NAME-elixir      AS elixir
FROM $BASE_NAME-erlang      AS erlang
FROM $BASE_NAME-fortran     AS fortran
FROM $BASE_NAME-go          AS go
FROM $BASE_NAME-groovy      AS groovy
FROM $BASE_NAME-guile       AS guile
FROM $BASE_NAME-haskell     AS haskell
FROM $BASE_NAME-haxe        AS haxe
FROM $BASE_NAME-java        AS java
FROM $BASE_NAME-julia       AS julia
FROM $BASE_NAME-lua         AS lua
FROM $BASE_NAME-racket      AS racket
FROM $BASE_NAME-nodejs      AS nodejs
FROM $BASE_NAME-nim         AS nim
FROM $BASE_NAME-objc        AS objc
FROM $BASE_NAME-ocaml       AS ocaml
FROM $BASE_NAME-octave      AS octave
FROM $BASE_NAME-perl        AS perl
FROM $BASE_NAME-php         AS php
FROM $BASE_NAME-python      AS python
FROM $BASE_NAME-r           AS r
FROM $BASE_NAME-raku        AS raku
FROM $BASE_NAME-ruby        AS ruby
FROM $BASE_NAME-rust        AS rust
FROM $BASE_NAME-scala       AS scala
FROM $BASE_NAME-swift       AS swift
FROM $BASE_NAME-tsc         AS tsc

# Build the main image:
FROM $BASE_IMAGE

# Install useful tools for shell environment:
RUN set -x \
 && apt-get update \
 && apt-get install -y \
        bash-completion \
        colorized-logs \
        emacs-nox \
        fish \
        fish-common \
        less \
        locales \
        silversearcher-ag \
        sudo \
        tig \
        tmate \
        tmux \
        vim \
        zsh \
        zsh-common \
 && true

# COPY in exports from runtime images:
COPY --from=ada     /export/ /
COPY --from=bash    /export/ /
COPY --from=clisp   /export/ /
COPY --from=clojure /export/ /
COPY --from=cpp     /export/ /
COPY --from=crystal /export/ /
COPY --from=csharp  /export/ /
COPY --from=dart    /export/ /
COPY --from=denojs  /export/ /
COPY --from=d       /export/ /
COPY --from=elixir  /export/ /
COPY --from=erlang  /export/ /
COPY --from=fortran /export/ /
COPY --from=go      /export/ /
COPY --from=groovy  /export/ /
COPY --from=guile   /export/ /
COPY --from=haskell /export/ /
COPY --from=haxe    /export/ /
COPY --from=java    /export/ /
COPY --from=julia   /export/ /
COPY --from=lua     /export/ /
COPY --from=nim     /export/ /
COPY --from=nodejs  /export/ /
COPY --from=objc    /export/ /
COPY --from=ocaml   /export/ /
COPY --from=octave  /export/ /
COPY --from=perl    /export/ /
COPY --from=php     /export/ /
COPY --from=python  /export/ /
COPY --from=racket  /export/ /
COPY --from=raku    /export/ /
COPY --from=r       /export/ /
COPY --from=ruby    /export/ /
COPY --from=rust    /export/ /
COPY --from=scala   /export/ /
COPY --from=swift   /export/ /
COPY --from=tsc     /export/ /

RUN set -x \
 && locale-gen en_US.UTF-8 \
 && true

# Copy homedir files to both /root and ~user:
COPY home/ /root/
COPY home/ /home/user/

# Make a user.
# Default to 1000 but changed to match host if necessary.
RUN set -x \
 && groupadd -g 1000 user \
 && useradd -u 1000 -g 1000 user \
 && adduser user sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && true

# Symlink ~root/ files to ~user/
RUN set -x \
 && chown user.user /home/user \
 && cd /home/user \
 && for d in $(ls -A1 /root/ | grep -Ev '(bashrc)'); do \
        ln -s /root/$d; \
    done \
 && true

# Link some user files and dirs fo ~root/ and ~user/ to user prefs:
RUN set -x \
 && ls -la /root && ls -la /home/user \
 && ln -s /me/ssh /root/.ssh \
 && ln -s /me/ssh /home/user/.ssh \
 && ls -la /root && ls -la /home/user \
 && true
