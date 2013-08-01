
include ../pkg_defs.make

# Package parameters

PKG_NAME = stiff

PKG_FORMAT = tar
PKG_TAR = stiff-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.astromatic.net/download/stiff/stiff-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = stiff-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --enable-static"; \
	fi; \
	zl=""; \
	if [ "x$(zlib_OVERRIDE)" != "xTRUE" ]; then \
		zl="--with-z-libdir=$(zlib_PREFIX)/lib"; \
	fi; \
	tf=""; \
	if [ "x$(libtiff_OVERRIDE)" != "xTRUE" ]; then \
		tf="--with-tiff-incdir=$(libtiff_PREFIX)/include --with-tiff-libdir=$(libtiff_PREFIX)/lib"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure \
	$${dyn} $${zl} $${tf} \
	--enable-threads \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


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



