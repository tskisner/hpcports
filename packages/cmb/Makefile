
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell git rev-parse --short HEAD)

# Package parameters

PKG_NAME = cmb

PKG_FORMAT = none

PKG_SRCDIR = cmb

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@mkdir -p $(STAGE); \
	echo "SHELL = $(SHELL)" > $(STAGE)/opts.make; \
	echo "PREFIX = $(HPCP_PREFIX)" >> $(STAGE)/opts.make; \
	echo "NAME = $(PKG_NAME)" >> $(STAGE)/opts.make; \
	echo "VERSION = $(PKG_VERSION)" >> $(STAGE)/opts.make


pkg-configure :
	@echo "" > /dev/null


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



