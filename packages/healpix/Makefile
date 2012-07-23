
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = healpix

PKG_FORMAT = tar
PKG_TAR = healpix-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = 
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = healpix-$(PKG_VERSION)

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
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	FCLIBS="$(FCLIBS)" MPIFCLIBS="$(MPIFCLIBS)" \
	MPICC="$(MPICC)" MPIFC="$(MPIFC)" MPICXX="$(MPICXX)" \
	IDL="idl" \
	./configure \
	$${dyn} \
	--with-cfitsio-cpp=$(cfitsio_CPPFLAGS) \
	--with-cfitsio-libs="$(cfitsio_LDFLAGS) $(cfitsio_LIBS_CC)" \
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



