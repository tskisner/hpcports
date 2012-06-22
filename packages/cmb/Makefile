
# System configuration

include ../../system/$(TARGET).make
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
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



