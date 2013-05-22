
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = openssl

PKG_FORMAT = tar
PKG_TAR = openssl-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.openssl.org/source/openssl-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = openssl-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_openssl.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) configure; \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="no-shared zlib"; \
	else \
		dyn="shared zlib-dynamic"; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xgnu" ]; then \
		./config $${dyn} --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xdarwin" ]; then \
		./Configure $${dyn} --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) darwin64-x86_64-cc; \
	fi; \
	if [ "x$(TOOLCHAIN)" = "xintel" ]; then \
		./config $${dyn} --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION); \
	fi


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export CC="$(CC)"; \
	export CFLAG="$(CFLAGS)"; \
	export ZLIB_INCLUDE="$(zlib_CPPFLAGS)"; \
	export LIBZLIB="$(zlib_LIBS_CC)"; \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export CC="$(CC)"; \
	export CFLAG="$(CFLAGS)"; \
	export ZLIB_INCLUDE="$(zlib_CPPFLAGS)"; \
	export LIBZLIB="$(zlib_LIBS_CC)"; \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



