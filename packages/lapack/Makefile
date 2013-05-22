
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = lapack

PKG_FORMAT = tar
PKG_TAR = lapack-$(PKG_VERSION).tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.netlib.org/lapack/lapack-$(PKG_VERSION).tgz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = lapack-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_lapack_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "SHELL = $(SHELL)" > make.inc; \
	echo "FORTRAN = $(FC)" >> make.inc; \
	echo "OPTS = $(FCFLAGS)" >> make.inc; \
	echo "DRVOPTS = $(FCFLAGS)" >> make.inc; \
	echo "NOOPT = $(FCFLAGS)" >> make.inc; \
	echo "LOADER = $(FC)" >> make.inc; \
	echo "LOADOPTS = " >> make.inc; \
	echo "TIMER = INT_ETIME" >> make.inc; \
	echo "CC = $(CC)" >> make.inc; \
	echo "CFLAGS = $(CFLAGS)" >> make.inc; \
	echo "ARCH = ar" >> make.inc; \
	echo "ARCHFLAGS = cr" >> make.inc; \
	echo "RANLIB = ranlib" >> make.inc; \
	echo "USEXBLAS = No" >> make.inc; \
	echo "XBLASLIB = " >> make.inc; \
	echo "BLASLIB = $(blas_LIBS_F77)" >> make.inc; \
	echo "LAPACKLIB = liblapack.a" >> make.inc; \
	echo "TMGLIB = libtmglib.a" >> make.inc; \
	echo "LAPACKELIB = liblapacke.a" >> make.inc; \
	echo "" >> make.inc


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	cp liblapack.a libtmglib.a $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



