IMAGE_NAME := no-ip
BIN_NAME := noip2
CONF_DIR := /usr/local/etc
LOCAL_CONF_DIR := $(shell pwd)/etc

build:
	docker build -t $(IMAGE_NAME) .

conf:
	docker run -it -v "$(LOCAL_CONF_DIR):$(CONF_DIR)" $(IMAGE_NAME) $(BIN_NAME) -C

run:
	docker run -v "$(LOCAL_CONF_DIR):$(CONF_DIR)" -it -d --restart=always $(IMAGE_NAME)

sh:
	docker run -v "$(LOCAL_CONF_DIR):$(CONF_DIR)" -it $(IMAGE_NAME) /bin/sh
