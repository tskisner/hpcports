
include ../pkg_defs.make

# Package parameters

PKG_NAME = wcslib

PKG_FORMAT = tar
PKG_TAR = wcslib-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib.tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = wcslib-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	F77="$(F77)" FFLAGS="$(FFLAGS)" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} \
	--with-pic \
	--with-cfitsioinc="$(cfitsio_PREFIX)/include" \
	--with-cfitsiolib="$(cfitsio_PREFIX)/lib" \
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



