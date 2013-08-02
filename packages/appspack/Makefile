
include ../pkg_defs.make

# Package parameters

PKG_NAME = appspack

PKG_FORMAT = tar
PKG_TAR = appspack-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://software.sandia.gov/appspack/downloads/appspack-5.0.1-C3.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = appspack-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	lapack="yes"; \
	if [ "x$(lapack_LIBS_CXX)" != "x" ]; then \
		lapack="$(lapack_LIBS_CXX)"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	MPICXX="$(MPICXX)" \
	LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	FLIBS="$(FLIBS)" \
	./configure \
	$${dyn} \
	--with-pic \
	--with-blas="$(blas_LIBS_CXX)" \
	--with-lapack="$${lapack}" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)"


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) LIBTOOLFLAGS="$(LIBTOOLFLAGS)" install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



