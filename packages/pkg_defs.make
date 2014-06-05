
# System configuration

include ../../system/$(HPCP_HOST).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell if test -e version; then head -n 1 version; else echo $(HPCP_ENV); fi)

PKG_DIR := $(shell pwd)

STAGE = staging_$(HPCP_HOST)
