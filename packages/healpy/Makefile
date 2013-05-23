
include ../pkg_defs.make

# Package parameters

PKG_NAME = healpy

PKG_FORMAT = tar
PKG_TAR = healpy-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://github.com/healpy/healpy/archive/$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = healpy-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_healpy.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export CC="$(CC)"; export CFLAGS="$(CFLAGS)"; \
	export CXX="$(CXX)"; export CXXFLAGS="$(CXXFLAGS)"; \
	export OMPFLAGS="$(OMPFLAGS)"; \
	export CFITSIO_EXT_PREFIX=$(cfitsio_PREFIX); \
	python setup.py build 


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages; \
	export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; \
	export CC="$(CC)"; export CFLAGS="$(CFLAGS)"; \
	export CXX="$(CXX)"; export CXXFLAGS="$(CXXFLAGS)"; \
	export OMPFLAGS="$(OMPFLAGS)"; \
	export CFITSIO_EXT_PREFIX=$(cfitsio_PREFIX); \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



