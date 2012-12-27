
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = libtiff

PKG_FORMAT = tar
PKG_TAR = tiff-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) ftp://ftp.remotesensing.org/pub/libtiff/tiff-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = tiff-$(PKG_VERSION)

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
	./configure $${dyn} $${zl} \
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



