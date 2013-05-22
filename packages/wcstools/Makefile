
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = wcstools

PKG_FORMAT = tar
PKG_TAR = wcstools-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://tdc-www.harvard.edu/software/wcstools/wcstools-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = wcstools-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "PREFIX = $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" > hpcp.make; \
	echo "CC = $(CC)" >> hpcp.make; \
	echo "CFLAGS = $(CFLAGS)" >> hpcp.make; \
	echo "LDFLAGS = $(LDFLAGS)" >> hpcp.make; \
	echo "LIBS = $(LIBS)" >> hpcp.make


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



