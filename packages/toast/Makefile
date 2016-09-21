
include ../pkg_defs.make

# Package parameters

PKG_NAME = toast

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git@github.com:tskisner/TOAST-legacy.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = TOAST-legacy

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./autogen.sh; \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn="--disable-shared --enable-static --enable-all-static --enable-static-boost"; \
	pyopt="--disable-python"; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn=""; \
		pyopt="--enable-python"; \
	fi; \
	fort=""; \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		fort="--disable-fortran"; \
	fi; \
	mp=""; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		mp="--disable-openmp"; \
	fi; \
	FFF="$(FCFLAGS)"; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		FFF="$${FFF} -save-temps"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	PYTHON="$(PYTHON)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(FC)" FCFLAGS="$${FFF}" \
	OPENMP_CXXFLAGS="$(OMPFLAGS)" \
	LIBTOOLFLAGS="$(LIBTOOLFLAGS)" \
	FCLIBS="$(FCLIBS)" MPIFCLIBS="$(MPIFCLIBS)" \
	MPICC="$(MPICC)" MPIFC="$(MPIFC)" MPICXX="$(MPICXX)" \
	LDFLAGS="-L$(python_PREFIX)/lib $(LDFLAGS) -L$(boost_PREFIX)/lib" LIBS="$(LIBS)" \
	./configure $${dyn} $${pyopt} $${mp} $${fort} $${host} \
	--enable-exp-all \
	--with-moatconfig=$(moat_PREFIX)/bin/moatconfig \
	--with-boost=$(boost_PREFIX) \
	--with-lapack="$(lapack_LIBS_CXX)" \
	--with-blas="$(blas_LIBS_CXX) $(OMPFLAGS) $(FCLIBS)" \
	--with-expat=$(expat_PREFIX) \
	--with-sqlite3=$(sqlite_PREFIX) \
	--with-getdata=$(getdata_PREFIX) \
	--with-hdf5=$(hdf5_PREFIX)/bin/h5c++ \
	--with-cfitsio="$(cfitsio_PREFIX)" \
	--with-wcslib="$(wcslib_PREFIX)" \
	--with-elemental="$(elemental_PREFIX)" \
	--with-healpix_cxx="$(healpix_PREFIX)" \
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



