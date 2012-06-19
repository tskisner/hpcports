
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = automake

PKG_VERSION = 1.12.1

PKG_FORMAT = tar
PKG_TAR = automake-1.12.1.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(POOL)/$(PKG_TAR) http://ftp.gnu.org/gnu/automake/automake-1.12.1.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = automake-1.12.1

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	FC="$(FC)" FCFLAGS="$(FCFLAGS)" \
	./configure \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



