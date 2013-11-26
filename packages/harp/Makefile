
include ../pkg_defs.make

# Package parameters

PKG_NAME = harp

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git@github.com:tskisner/HARP.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = HARP

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./autogen.sh; \
	dyn="--disable-shared"; \
	pyopt="--disable-python"; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn=""; \
		pyopt="--enable-python"; \
	fi; \
	fort=""; \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		fort="--disable-fortran"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	OPENMP_CXXFLAGS="$(OMPFLAGS)" \
	LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
	MPICXX="$(MPICXX)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} $${pyopt} $${fort} \
	--with-boost=$(boost_PREFIX) \
	--with-lapack="$(lapack_LIBS_CXX)" \
	--with-blas="$(blas_LIBS_CXX)" \
	--with-cfitsio="$(cfitsio_PREFIX)" \
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



