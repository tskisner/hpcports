
include ../pkg_defs.make

# Package parameters

PKG_NAME = serf

PKG_FORMAT = tar
PKG_TAR = serf-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://serf.googlecode.com/svn/src_releases/serf-$(PKG_VERSION).tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = serf-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	ssl=""; \
	if [ "x$(openssl_PREFIX)" != "x" ]; then \
		ssl="OPENSSL=$(openssl_PREFIX)"; \
	fi; \
	expat=""; \
	if [ "x$(expat_PREFIX)" != "x" ]; then \
		expat="LINKFLAGS=-L$(expat_PREFIX)/lib"; \
	fi; \
	zlib=""; \
	if [ "x$(zlib_PREFIX)" != "x" ]; then \
		zlib="ZLIB=$(zlib_PREFIX)"; \
	fi; \
	scons \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	CC="$(CC)" CFLAGS="$(CFLAGS)" $${expat} $${zlib} \
	APR="$(apr_PREFIX)" APU="$(apr_util_PREFIX)" $${ssl}


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	scons \
	PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	scons -c


# Include common package rules

include ../pkg.make


