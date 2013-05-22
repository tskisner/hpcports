
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = astrometry

PKG_FORMAT = tar
PKG_TAR = astrometry.net-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://astrometry.net/downloads/astrometry.net-$(PKG_VERSION).tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = astrometry.net-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	shrd=""; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		shrd="-dynamiclib -Wl,-undefined,dynamic_lookup"; \
	else \
		shrd="-shared"; \
	fi; \
	SHAREDLIBFLAGS_DEF="$${shrd}" $(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	INSTALL_DIR="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



