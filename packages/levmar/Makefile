
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = levmar

PKG_FORMAT = tar
PKG_TAR = levmar-$(PKG_VERSION).tgz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://www.ics.forth.gr/~lourakis/levmar/levmar-$(PKG_VERSION).tgz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = levmar-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)/build

PKG_PATCHES = hpcp_install.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	blaslib=`echo $(blas_LIBS_CC) | sed -e "s#-l##g" -e "s# #;#g"`; \
	lapacklib=`echo $(lapack_LIBS_CC) | sed -e "s#-l##g" -e "s# #;#g"`; \
	dyn="-DBUILD_SHARED_LIBS:BOOL=ON"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="-DBUILD_SHARED_LIBS:BOOL=OFF"; \
	fi; \
	CC="$(CC) $(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	LIBS="$(LIBS) -lm" \
	CXX="$(CXX) $(CXXFLAGS)" \
	FC="$(F77) $(FFLAGS)" \
	cmake \
	$${dyn} \
	-DHAVE_LAPACK:BOOL=ON \
	-DNEED_F2C:BOOL=OFF \
	-DINSTALL_LIBS=ON \
	-DLAPACKBLAS_LIB_NAMES="$${lapacklib};$${blaslib};pthread;m" \
	-DCMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION) \
	..


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE)


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	mkdir -p $(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION); \
	$(MAKE) install


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



