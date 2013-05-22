
# System configuration

include ../../system/$(HPCP_HOST).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

PKG_DIR := $(shell pwd)

STAGE = staging_$(HPCP_TARGET)

PKG_OVERRIDE = $($(PKG_NAME)_OVERRIDE)

