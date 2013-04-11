
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = atlas

PKG_FORMAT = tar
PKG_TAR = atlas$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/math-atlas/files/Stable/$(PKG_VERSION)/atlas$(PKG_VERSION).tar.bz2/download
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = ATLAS

PKG_BUILDDIR = $(PKG_SRCDIR)/build

PKG_PATCHES = hpcp-throttle.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn="--dylibs"; \
	fi; \
	../configure $${dyn} \
	-C ic "$(CC)" \
	-F ic "$(CFLAGS)" \
	-C if "$(F77)" \
	-F if "$(FFLAGS)" \
	-D c -DWALL \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



