ARG FROM
FROM $FROM
ARG TAG

SHELL [ "bash", "-c" ]

RUN set -x \
 && apt-get update \
 && touch /stamp \
 && apt-get install -y \
        gfortran \
 && find /usr /etc -cnewer /stamp | cpio -dump /export \
 && true

RUN set -x \
 && wget -nv https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh \
 && touch /stamp \
 && ( \
        sleep .2; echo; \
        sleep .2; echo yes; \
        sleep .2; echo; \
        while ! [[ -d /root/miniforge3/envs ]]; do \
            printf . >&2; \
            sleep 1; \
        done; \
        echo yes \
    ) | sh Miniforge3-Linux-x86_64.sh \
 && source <(/root/miniforge3/bin/conda shell.bash hook) \
 && conda install -y fpm \
 && chmod -R go+rw /root \
 && find /root -cnewer /stamp | cpio -dump /export \
 && true
