
include ../pkg_defs.make

# Package parameters

PKG_NAME = glog

PKG_FORMAT = tar
PKG_TAR = glog-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://google-glog.googlecode.com/files/glog-$(PKG_VERSION).tar.gz

PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = glog-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null

pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


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



