
include ../pkg_defs.make

# Package parameters

PKG_NAME = SuiteSparse

PKG_FORMAT = tar
PKG_TAR = SuiteSparse-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = SuiteSparse

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null

pkg-configure :
	@echo "" > /dev/null

pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LAPACK="$(lapack_LIBS_FC)" BLAS="$(blas_LIBS_FC)" CXX=$(HPCP_CXX)

pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include; \
	$(MAKE) install INSTALL_LIB=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib \
		INSTALL_INCLUDE=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/include

pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean

# Include common package rules

include ../pkg.make



