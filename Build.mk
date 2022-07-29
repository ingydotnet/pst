ROOT := $(shell git rev-parse --show-toplevel)
include $(ROOT)/Config.mk

NAME ?= $(shell basename $(shell pwd))

VAR := $(shell echo $(NAME) | tr a-z A-Z)

ifdef TAG_$(VAR)
    TAG := $(TAG_$(VAR))
endif
ifdef TAG
    override DOCKER_BUILD_ARGS += --build-arg TAG=$(TAG)
endif
ifdef IMAGE_$(VAR)
    DOCKER_IMAGE := $(IMAGE_$(VAR))
else
    DOCKER_IMAGE := $(DOCKER_USER)/$(DOCKER_NAME)-$(NAME)
endif
ifdef FROM_$(VAR)
    override DOCKER_BUILD_ARGS += --build-arg FROM=$(FROM_$(VAR))
else
    override DOCKER_BUILD_ARGS += --build-arg FROM=$(IMAGE_BASE)
endif

BUILD := $(BUILT)/$(NAME)-$(TAG)
ifeq (main,$(NAME))
    DEPS := $(shell find $(ROOT)/lib)
else ifeq (base,$(NAME))
    DEPS := $(shell find $(ROOT)/lib/$(NAME) -type f)
else
    DEPS := $(shell find $(ROOT)/src/$(NAME) -type f)
endif
DEPS += \
    $(ROOT)/Makefile \
    $(ROOT)/Build.mk \

CMD ?= bash

default:

force:
	rm -fr $(BUILD)

build:: $(BUILD)

shell:: build
	touch $(BASH_HISTORY)
	docker run -it --rm \
	    --volume $(ROOT):/host \
	    --volume $(BASH_HISTORY):/root/.bash_history \
	    --workdir /host \
	    --hostname docker-$(app) \
	    $(DOCKER_IMAGE) \
	    bash

push::
	docker push $(DOCKER_IMAGE)

$(BUILD): $(DEPS)
	docker build \
	    $(DOCKER_BUILD_ARGS) \
	    --tag $(DOCKER_IMAGE) .
	touch $@
