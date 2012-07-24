
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = boost_numeric

PKG_FORMAT = tar
PKG_TAR = boost-numeric-bindings-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://mathema.tician.de/news.tiker.net/download/software/boost-numeric-bindings/boost-numeric-bindings-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = boost-numeric-bindings

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-build :
	@echo "" > /dev/null


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION) \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



