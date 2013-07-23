
include ../pkg_defs.make

# Package parameters

PKG_NAME = gitgit

PKG_FORMAT = zip
PKG_ZIP = git-$(PKG_VERSION).zip
PKG_ZIP_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_ZIP) https://github.com/git/git/archive/v$(PKG_VERSION).zip
PKG_ZIP_EXTRACT = $(UZIP)

PKG_SRCDIR = git-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR)/git-$(PKG_VERSION); \
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
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR)/git-$(PKG_VERSION); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR)/git-$(PKG_VERSION); \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR)/git-$(PKG_VERSION); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



