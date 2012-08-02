
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = toast

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git@github.com:tskisner/TOAST.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = TOAST

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
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	PYTHON="$(PYTHON)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	OPENMP_CXXFLAGS=${OMPFLAGS} \
	FCLIBS="$(FCLIBS)" MPIFCLIBS="$(MPIFCLIBS)" \
	MPICC="$(MPICC)" MPIFC="$(MPIFC)" MPICXX="$(MPICXX)" \
	LDFLAGS="$(python_LDFLAGS) $(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} $${pyopt} \
	--with-moatconfig=$(moat_PREFIX)/bin/moatconfig \
	--with-boost=$(boost_PREFIX) \
	--with-expat=$(expat_PREFIX) \
	--with-sqlite3=$(sqlite_PREFIX) \
	--with-getdata=$(getdata_PREFIX) \
	--with-cfitsio-cpp=$(cfitsio_CPPFLAGS) \
	--with-cfitsio-libs="$(cfitsio_LDFLAGS)$(cfitsio_LIBS_CXX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


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



