
include ../pkg_defs.make

# Package parameters

PKG_NAME = ceres

PKG_FORMAT = tar
PKG_TAR = ceres-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://ceres-solver.org/ceres-solver-$(PKG_VERSION).tar.gz

PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = ceres-solver-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)-build

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null

pkg-configure :
	@mkdir -p $(STAGE)/$(PKG_BUILDDIR); \
	cd $(STAGE)/$(PKG_BUILDDIR); \
	cmake ../$(PKG_SRCDIR) \
		-DEIGEN_INCLUDE_DIR=$(eigen_PREFIX)/include/eigen3 \
		-DSUITESPARSE_INCLUDE_DIR_HINTS=$(SuiteSparse_PREFIX)/include \
		-DSUITESPARSE_LIBRARY_DIR_HINTS=$(SuiteSparse_PREFIX)/lib \
		-DGLOG_INCLUDE_DIR=$(glog_PREFIX)/include \
		-DGLOG_LIBRARY=$(glog_PREFIX)/lib/libglog.so \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING=FALSE \
		-DBUILD_EXAMPLES=FALSE \
		-DCMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)

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



