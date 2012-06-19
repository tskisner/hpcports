
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = toast

PKG_VERSION = 8b1e811

PKG_FORMAT = git
PKG_GIT_CLONE = $(GIT) clone git@github.com:tskisner/TOAST.git
PKG_GIT_CHECKOUT = $(GIT) checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1; ./autogen.sh

PKG_SRCDIR = TOAST

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn="--disable-shared"; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		dyn=""; \
	fi; \
	pyopt="--disable-python"; \
	if [ "x$(PYTHON)" != "x" ]; then \
		pyopt="--enable-python"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	PYTHON="$(PYTHON)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	FCLIBS="$(FCLIBS)" MPIFCLIBS="$(MPIFCLIBS)" \
	MPICC="$(MPICC)" MPIFC="$(MPIFC)" MPICXX="$(MPICXX)" \
	./configure \
	$${dyn} $${pyopt} \
	--with-moatconfig=$(moat_PREFIX)/bin/moatconfig \
	--with-boost=$(boost_PREFIX) \
	--with-expat=$(expat_PREFIX) \
	--with-sqlite=$(sqlite_PREFIX) \
	--with-cfitsio-cpp=$(cfitsio_CPPFLAGS) \
	--with-cfitsio-libs="$(cfitsio_LDFLAGS)$(cfitsio_LIBS_CXX)" \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



