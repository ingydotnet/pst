include Config.mk

DOCKER_TAG := $(PST_VERSION)
DOCKER_IMAGE := $(DOCKER_USER)/$(DOCKER_NAME):$(DOCKER_TAG)

DOCKER_LANGUAGES := $(LANGUAGES:%=src/%)

# DOCKER_BUILD_ARGS += \
#     --build-arg http_proxy=http://squid-deb-proxy:8000 \
#     --network squid \

ifdef NOCACHE
DOCKER_BUILD_ARGS += --no-cache
endif

DOCKER_MAIN_BUILD_ARGS += \
    $(DOCKER_BUILD_ARGS) \
    --build-arg BASE_NAME=$(DOCKER_USER)/$(DOCKER_NAME) \
    --build-arg BASE_IMAGE=$(IMAGE_BASE) \


BMAKE := $(MAKE) -f $(ROOT)/Build.mk --no-print-directory
BMAKE := $(MAKE) -f $(ROOT)/Build.mk

SHELLS := $(LANGUAGES:%=shell-%)

#------------------------------------------------------------------------------
default:

bump release:
	@echo "Not a BPAN Makefile. Use 'make publish' to release."
	@exit 1

publish:
	bpan bump -p
	$(MAKE) force push
	bpan release

add-lang:
	@[[ "$L" ]] || { \
	    echo 'Usage: make $@ L=<language-name-slug>'; \
	    exit 1; \
	}
	( \
	    set -ex; \
	    cp -Ppr lib/lang src/$L; \
	    vim Languages src/$L/* lib/main/Dockerfile -O \
	)

force:
	rm -fr $(BUILT)

purge: force
	docker images | \
	    grep ^$(app) | \
	    awk '{print $$1 ":" $$2}' | \
	    xargs docker rmi -f || true

update: meta-update
ifneq (,$(shell command -v bpan))
	bpan update
endif

meta-update:
	$(ROOT)/lib/tool/bin/meta-update

# build: proxy-up lib/base $(DOCKER_LANGUAGES) lib/main proxy-down
build: lib/base $(DOCKER_LANGUAGES) lib/main

.PHONY: test
test:
	bpan $@

clean:
	rm -fr target
	rm -f lib/*/tmp.*

push: build
	docker push $(DOCKER_IMAGE)

shell-%: src/%
	touch $(BASH_HISTORY)
	$(BMAKE) -C $< shell

$(DIRS):
	mkdir -p $@

lib/base $(DOCKER_LANGUAGES): always
	$(BMAKE) -C $@ build \
	    DOCKER_BUILD_ARGS='$(DOCKER_BUILD_ARGS)'

lib/main: always
	$(BMAKE) -C $@ build \
	    DOCKER_BUILD_ARGS='$(DOCKER_MAIN_BUILD_ARGS)'

always:

# See: https://gist.github.com/reegnz/990d0b01b5f5e8670f78257875d8daa8
# This approach failed but might be able to fix it later.
proxy-up: proxy-build
	-docker kill squid-deb-proxy
	rm -f proxy-id
	docker run --rm -d --network squid \
	    --volume squid-deb-proxy:/data \
	    --name squid-deb-proxy \
	    $(DOCKER_USER)/squid-deb-proxy

proxy-down:
	-docker kill squid-deb-proxy
	rm -f proxy-id

proxy-build:
	( \
	    cd lib/proxy; \
	    docker build \
		-t $(DOCKER_USER)/squid-deb-proxy \
		. \
	)
	-docker volume create squid-deb-proxy
	-docker network create squid
