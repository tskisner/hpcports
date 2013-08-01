
include ../pkg_defs.make

# Package parameters

PKG_NAME = es

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://github.com/rcthomas/es.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = es

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./autogen.sh; \
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
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	FLIBS="$(FLIBS)" \
	./configure \
	$${dyn} \
	--with-pic \
	--with-blas="$(blas_LIBS_CXX)" \
	--with-lapack="$${lapack}" \
	--with-cfitsio-libs="$(cfitsio_LIBS_CXX)" \
	--with-appspack-libs="$(appspack_LIBS_CXX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


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



