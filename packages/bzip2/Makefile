
include ../pkg_defs.make

# Package parameters

PKG_NAME = bzip2

PKG_FORMAT = tar
PKG_TAR = bzip2-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.bzip.org/$(PKG_VERSION)/bzip2-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = bzip2-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_bzip2_make.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@echo "" > /dev/null


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



