
include ../pkg_defs.make

# Package parameters

PKG_NAME = healpix_cxx

PKG_FORMAT = tar
PKG_TAR = Healpix_3.30_2015Oct08.tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://downloads.sourceforge.net/project/healpix/Healpix_3.30/Healpix_3.30_2015Oct08.tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = Healpix_$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_pkgconfig.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR)/src/cxx/autotools; \
	host=""; \
	if [ "x$(HPCP_CROSS_HOST)" != "x" ]; then \
		host="--host=$(HPCP_CROSS_HOST)"; \
	fi; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --enable-static --enable-static-exec"; \
	fi; \
	libtoolize; \
	autoreconf --install; \
	CC="$(CC)" CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	CFITSIO_CFLAGS="-I$(cfitsio_PREFIX)/include" CFITSIO_LIBS="-L$(cfitsio_PREFIX)/lib -lcfitsio" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	./configure $${dyn} $${host} \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR)/src/cxx/autotools; \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR)/src/cxx/autotools; \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR)/src/cxx/autotools; \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



