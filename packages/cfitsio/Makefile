
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = cfitsio

PKG_FORMAT = tar
PKG_TAR = cfitsio3310.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio3310.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = cfitsio

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_installname.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(F77)" FFLAGS="$(FFLAGS)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE); \
	$(MAKE) shared; \
	$(MAKE) fpack; \
	$(MAKE) funpack


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install; \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin; \
	cp fpack funpack $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/bin/


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



