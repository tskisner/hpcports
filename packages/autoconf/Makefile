
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = autoconf

PKG_VERSION = 2.69

PKG_FORMAT = tar
PKG_TAR = autoconf-2.69.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(POOL)/$(PKG_TAR) http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = autoconf-2.69

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



