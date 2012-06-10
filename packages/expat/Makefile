
# System configuration

include ../../system/$(TARGET).make
include ../../system/defaults.make

# Package parameters

PKG_NAME = expat

PKG_VERSION = 2.0.1

PKG_COMPRESSED = expat-2.0.1.tar.gz

PKG_UNCOMPRESSED = expat-2.0.1

PKG_BUILDDIR = $(PKG_UNCOMPRESSED)

PKG_XTAR = $(GXTAR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		./configure CC="$(CC)" CFLAGS="$(CFLAGS)" \
		LDFLAGS="$(LDFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	else \
		./configure CC="$(CC)" CFLAGS="$(CFLAGS)" \
		LDFLAGS="$(LDFLAGS)" \
		CXX="$(CXX)" CXXFLAGS="$(CXXFLAGS)" \
		F77="$(F77)" FFLAGS="$(FFLAGS)" \
		--disable-shared \
		--prefix=$(PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	fi


pkg-preinstall :
	@echo "" > /dev/null


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



