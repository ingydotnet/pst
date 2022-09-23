SHELL := bash -e -u -o pipefail -O inherit_errexit

app := pst

ifndef PST_ROOT
    $(error PST_ROOT not set. 'source /path/to/$(app)/.rc')
endif

PST_VERSION := $(shell git config -f $(PST_ROOT)/.bpan/config package.version)

BASE_NAME := $(app)/$(app)

ROOT := $(shell git rev-parse --show-toplevel)

BASH_HISTORY := /tmp/docker-bash-history

BUILT := $(ROOT)/.git/built
$(shell mkdir -p $(BUILT))

DOCKER_USER := ingy
DOCKER_NAME := $(app)

TAG_MAIN := $(PST_VERSION)
IMAGE_MAIN := $(DOCKER_USER)/$(DOCKER_NAME):$(TAG_MAIN)

UBUNTU := ubuntu:22.04
FROM_BASE := $(UBUNTU)
IMAGE_BASE := $(DOCKER_USER)/$(app)-base

LANGUAGES := $(shell cd $(ROOT)/src && echo *)
