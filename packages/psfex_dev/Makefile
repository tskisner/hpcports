
include ../pkg_defs.make

# Package parameters

PKG_NAME = psfex_dev

PKG_FORMAT = tar
PKG_TAR = psfex-branches.r198.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.astromatic.net/download/psfex/psfex-branches.r198.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = branches.r198

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR)/rhl; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --enable-static"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure \
	$${dyn} \
	--enable-threads \
	--with-atlas="$(atlas_PREFIX)/lib" \
	--with-atlas-incdir="$(atlas_PREFIX)/include" \
	--with-plplot="$(plplot_PREFIX)/lib" \
	--with-plplot-incdir="$(plplot_PREFIX)/include" \
	--with-fftw="$(sfftw_PREFIX)/lib" \
	--with-fftw-incdir="$(sfftw_PREFIX)/include" \
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



