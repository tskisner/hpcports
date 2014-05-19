
include ../pkg_defs.make

# Package parameters

PKG_NAME = lua

PKG_FORMAT = tar
PKG_TAR = lua-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.lua.org/ftp/lua-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = lua-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_build.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) \
	PREFIX="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)"


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) \
	PREFIX="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" \
	install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



