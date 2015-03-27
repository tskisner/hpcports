
include ../pkg_defs.make

# Package parameters

PKG_NAME = libpng

PKG_FORMAT = tar
PKG_TAR = libpng-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://prdownloads.sourceforge.net/libpng/libpng-$(PKG_VERSION).tar.gz?download
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = libpng-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CPPFLAGS="-I$(zlib_PREFIX)/include" \
	LDFLAGS="-L$(zlib_PREFIX)/lib $(LDFLAGS)" \
	LIBS="$(LIBS)" \
	./configure $${dyn} $${host} \
	--with-zlib-prefix="$(zlib_PREFIX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) install; $(MAKE) install-lib


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



