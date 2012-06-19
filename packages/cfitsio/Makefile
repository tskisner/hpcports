
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = cfitsio

PKG_VERSION = 3.30

PKG_FORMAT = tar
PKG_TAR = cfitsio3300.tar.gz
PKG_TAR_FETCH = curl ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio3300.tar.gz -o $(POOL)/$(PKG_TAR)
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = cfitsio

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(F77)" FFLAGS="$(FFLAGS)" \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		cd $(STAGE)/$(PKG_BUILDDIR); \
		$(MAKE) shared >> ../log.build 2>&1; \
	fi


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



