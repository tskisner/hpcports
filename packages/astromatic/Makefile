
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell $(SHELL) ./gen_version.sh $(MD5) $(HPCP_ENV))

# Package parameters

PKG_NAME = astromatic

PKG_FORMAT = none

PKG_SRCDIR = astromatic

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@echo "" > /dev/null


pkg-install :
	@mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-clean :
	@echo "" > /dev/null


# Include common package rules

include ../pkg.make



