
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = eigen

PKG_FORMAT = tar
PKG_TAR = eigen-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://bitbucket.org/eigen/eigen/get/$(PKG_VERSION).tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = eigen-eigen-5097c01bcdc4

PKG_BUILDDIR = eigen_build

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --disable-python --disable-perl"; \
	fi; \
	cmake $${dyn} \
	-D CMAKE_C_COMPILER="$(CC)" \
	-D CMAKE_CXX_COMPILER="$(CXX)" \
	-D CMAKE_C_FLAGS="$(CFLAGS)" \
	-D CMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-D CMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION) \
	../$(PKG_SRCDIR)


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



