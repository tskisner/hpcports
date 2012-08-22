
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = tcl

PKG_FORMAT = tar
PKG_TAR = tcl$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://prdownloads.sourceforge.net/tcl/tcl$(PKG_VERSION)-src.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = tcl$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_config.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) configure; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR)/unix; \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



