
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = cfitsio

PKG_VERSION = 3.30

PKG_COMPRESSED = cfitsio3300.tar.gz

PKG_UNCOMPRESSED = cfitsio

PKG_BUILDDIR = $(PKG_UNCOMPRESSED)

PKG_XTAR = $(GXTAR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	./configure CC="$(CC)" CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
	FC="$(F77)" FFLAGS="$(FFLAGS)" \
	--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-preinstall :
	@if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		cd $(STAGE)/$(PKG_BUILDDIR); \
		$(MAKE) shared >> ../log.build 2>&1; \
	fi


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



