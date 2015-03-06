
include ../pkg_defs.make

# Package parameters

PKG_NAME = astrometry.net

PKG_FORMAT = tar
PKG_TAR = astrometry.net-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://astrometry.net/downloads/astrometry.net-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = astrometry.net-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null

pkg-configure :
	@echo "" > /dev/null

pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) WCSLIB_INC="-I$(wcslib_PREFIX)/include" WCSLIB_LIB="-L$(wcslib_PREFIX)/lib $(wcslib_LIBS_CC)" ZLIB_INC="-I$(zlib_PREFIX)/include" ZLIB_LIB="-L$(zlib_PREFIX)/lib $(zlib_LIBC_CC)" CFITS_INC="-I$(cfitsio_PREFIX)/include" CFITS_LIB="-L$(cfitsio_PREFIX)/lib $(cfitsio_LIBS_CC)"; \
	$(MAKE) -C util py WCSLIB_INC="-I$(wcslib_PREFIX)/include" WCSLIB_LIB="-L$(wcslib_PREFIX)/lib $(wcslib_LIBS_CC)" ZLIB_INC="-I$(zlib_PREFIX)/include" ZLIB_LIB="-L$(zlib_PREFIX)/lib $(zlib_LIBC_CC)" CFITS_INC="-I$(cfitsio_PREFIX)/include" CFITS_LIB="-L$(cfitsio_PREFIX)/lib $(cfitsio_LIBS_CC)"; \
	$(MAKE) -C libkd py WCSLIB_INC="-I$(wcslib_PREFIX)/include" WCSLIB_LIB="-L$(wcslib_PREFIX)/lib $(wcslib_LIBS_CC)" ZLIB_INC="-I$(zlib_PREFIX)/include" ZLIB_LIB="-L$(zlib_PREFIX)/lib $(zlib_LIBC_CC)" CFITS_INC="-I$(cfitsio_PREFIX)/include" CFITS_LIB="-L$(cfitsio_PREFIX)/lib $(cfitsio_LIBS_CC)";


# "make py" tries to build plotstuff, which depends on cairo...
#$(MAKE) py WCSLIB_INC="-I$(wcslib_PREFIX)/include" WCSLIB_LIB="-L$(wcslib_PREFIX)/lib $(wcslib_LIBS_CC)" ZLIB_INC="-I$(zlib_PREFIX)/include" ZLIB_LIB="-L$(zlib_PREFIX)/lib $(zlib_LIBC_CC)" CFITS_LIB="-L$(cfitsio_PREFIX)/lib $(cfitsio_LIBS_CC)"

pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install INSTALL_DIR=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)

pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



