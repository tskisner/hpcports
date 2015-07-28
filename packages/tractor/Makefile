
include ../pkg_defs.make

# Package parameters

PKG_NAME = tractor

PKG_FORMAT = tar
PKG_TAR = tractor-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://github.com/dstndstn/tractor/archive/$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = tractor-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null

pkg-configure :
	@echo "" > /dev/null

pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE); \
	$(MAKE) ceres SUITESPARSE_LIB_DIR="${SuiteSparse_PREFIX}/lib" BLAS_LIB="${blas_LIBS_CC}"

# python setup.py build

pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install INSTALL_DIR=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	(cd $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/python && ln -s . $(python_SITE) && ln -s . site-packages)

pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean

# Include common package rules

include ../pkg.make



