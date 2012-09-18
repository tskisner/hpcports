
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = mysql_client

PKG_FORMAT = tar
PKG_TAR = mysql_client-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.0.2.tar.gz/from/http://cdn.mysql.com/
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = mysql-connector-c-6.0.2

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--disable-shared --disable-python --disable-perl"; \
	fi; \
	CMAKE_C_COMPILER="$(CC)" CMAKE_C_FLAGS="$(CFLAGS)" \
	CMAKE_CXX_COMPILER="$(CXX)" CMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	cmake -DCMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


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



