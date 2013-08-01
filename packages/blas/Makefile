
include ../pkg_defs.make

# Package parameters

PKG_NAME = blas

PKG_FORMAT = tar
PKG_TAR = blas.tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.netlib.org/blas/blas.tgz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = BLAS

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "PLAT = " > make.inc; \
	echo "SHELL = $(SHELL)" >> make.inc; \
	echo "FORTRAN = $(F77)" >> make.inc; \
	echo "OPTS = $(FFLAGS)" >> make.inc; \
	echo "DRVOPTS = $(FFLAGS)" >> make.inc; \
	echo "NOOPT = " >> make.inc; \
	echo "LOADER = $(F77)" >> make.inc; \
	echo "LOADOPTS = " >> make.inc; \
	echo "ARCH = ar" >> make.inc; \
	echo "ARCHFLAGS = cr" >> make.inc; \
	echo "RANLIB = ranlib" >> make.inc; \
	echo "BLASLIB = libblas.a" >> make.inc; \
	echo "" >> make.inc; \


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	cp libblas.a $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



