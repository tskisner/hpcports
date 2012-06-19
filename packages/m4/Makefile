
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = m4

PKG_VERSION = 1.4.16

PKG_FORMAT = tar
PKG_TAR = m4-1.4.16.tar.bz2
PKG_TAR_FETCH = $(CURL) http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.bz2 -o $(POOL)/$(PKG_TAR)
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = m4-1.4.16

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
	./configure \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



