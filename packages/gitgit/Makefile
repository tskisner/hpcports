
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = gitgit

PKG_FORMAT = zip
PKG_ZIP = git-$(PKG_VERSION).zip
PKG_ZIP_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_ZIP) https://github.com/git/git/archive/v1.8.0.2.zip
PKG_ZIP_EXTRACT = $(UZIP)

PKG_SRCDIR = git-git-d636c48

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) configure; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(gettext_CPPFLAGS)" \
	LDFLAGS="$(LDFLAGS) $(gettext_LDFLAGS)" LIBS="$(gettext_LIBS_CC) $(LIBS)" \
	./configure \
	--without-python \
	--with-openssl=$(openssl_PREFIX) \
	--with-curl=$(curl_PREFIX) \
	--with-expat=$(expat_PREFIX) \
	--with-zlib=$(zlib_PREFIX) \
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



