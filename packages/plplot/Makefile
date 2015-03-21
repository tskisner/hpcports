
include ../pkg_defs.make

# Package parameters

PKG_NAME = plplot

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://git.code.sf.net/p/plplot/plplot plplot-plplot
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = plplot-plplot

#PKG_FORMAT = tar
#PKG_TAR = plplot-$(PKG_VERSION).tar.gz
#PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/plplot/files/plplot/$(PKG_VERSION)%20Source/plplot-$(PKG_VERSION).tar.gz/download
#PKG_TAR_EXTRACT = $(GXTAR)

#PKG_SRCDIR = plplot-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)/build

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	dyn="-DBUILD_SHARED_LIBS:BOOL=ON"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="-DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_DYNDRIVERS:BOOL=OFF"; \
	fi; \
	CC="$(CC) $(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	LIBS="$(LIBS)" \
	CXX="$(CXX) $(CXXFLAGS)" \
	FC="$(F77) $(FFLAGS)" \
	CMAKE_INCLUDE_PATH="$(tcl_PREFIX)/include:$(tk_PREFIX)/include" \
	CMAKE_LIBRARY_PATH="$(tcl_PREFIX)/lib:$(tk_PREFIX)/lib:$(tcl_PREFIX)/lib64:$(tk_PREFIX)/lib64" \
	cmake $${dyn} \
	-D DEFAULT_NO_CAIRO_DEVICES:BOOL=ON \
	-D DEFAULT_NO_QT_DEVICES:BOOL=ON \
	-D CMAKE_INSTALL_PREFIX="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)" \
	..


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



