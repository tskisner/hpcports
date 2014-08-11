
include ../pkg_defs.make

# Package parameters

PKG_NAME = libtiff

PKG_FORMAT = tar
PKG_TAR = tiff-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://download.osgeo.org/libtiff/tiff-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = tiff-$(PKG_VERSION)

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
	zl=""; \
	if [ "x$(zlib_OVERRIDE)" != "xTRUE" ]; then \
		zl="--with-zlib-include-dir=$(zlib_PREFIX)/include --with-zlib-lib-dir=$(zlib_PREFIX)/lib"; \
	fi; \
	osx=""; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		osx="-DHAVE_APPLE_OPENGL_FRAMEWORK"; \
	fi; \
	CC="$(CC)" CFLAGS="$(CFLAGS) $${osx}" \
	LDFLAGS="$(LDFLAGS)" LIBS="$(LIBS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS) $${osx}" \
	./configure $${dyn} $${zl} $${host} \
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



