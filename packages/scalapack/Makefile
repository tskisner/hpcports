
include ../pkg_defs.make

# Package parameters

PKG_NAME = scalapack

PKG_FORMAT = tar
PKG_TAR = scalapack-$(PKG_VERSION).tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.netlib.org/scalapack/scalapack-$(PKG_VERSION).tgz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = scalapack-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_scalapack_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "CDEFS = -DAdd_" > SLmake.inc; \
	echo "FC = $(MPIFC)" >> SLmake.inc; \
	echo "CC = $(MPICC)" >> SLmake.inc; \
	echo "FCFLAGS = $(FCFLAGS)" >> SLmake.inc; \
	echo "CCFLAGS = $(CFLAGS)" >> SLmake.inc; \
	echo "NOOPT = " >> SLmake.inc; \
	echo "FCLOADER = $(MPIFC)" >> SLmake.inc; \
	echo "CCLOADER = $(MPICC)" >> SLmake.inc; \
	echo "FCLOADFLAGS = $(FCFLAGS)" >> SLmake.inc; \
	echo "CCLOADFLAGS = $(CFLAGS)" >> SLmake.inc; \
	echo "ARCH = ar" >> SLmake.inc; \
	echo "ARCHFLAGS = cr" >> SLmake.inc; \
	echo "RANLIB = ranlib" >> SLmake.inc; \
	echo "SCALAPACKLIB = libscalapack.a" >> SLmake.inc; \
	echo "BLASLIB = $(blas_LIBS_F77)" >> SLmake.inc; \
	echo "LAPACKLIB = $(lapack_LIBS_F77)" >> SLmake.inc; \
	echo "LIBS = \$$(LAPACKLIB) \$$(BLASLIB)" >> SLmake.inc; \
	echo "" >> SLmake.inc; \


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib; \
	cp libscalapack.a $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



