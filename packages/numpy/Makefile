
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = numpy

PKG_FORMAT = tar
PKG_TAR = numpy-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://sourceforge.net/projects/numpy/files/NumPy/$(PKG_VERSION)/numpy-$(PKG_VERSION).tar.gz/download
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = numpy-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "[ALL]" > site.cfg; \
	blascpp=`echo $(blas_CPPFLAGS) | sed -e "s#-I##g"`; \
	lapackcpp=`echo $(lapack_CPPFLAGS) | sed -e "s#-I##g"`; \
	fftwcpp=`echo $(fftw_CPPFLAGS) | sed -e "s#-I##g"`; \
	include=`echo "$${blascpp} $${lapackcpp} $${fftwcpp}" | sed -e "s# #:#g"`; \
	echo "include_dirs = $${include}" >> site.cfg; \
	blasld=`echo $(blas_LDFLAGS) | sed -e "s#-L##g"`; \
	lapackld=`echo $(lapack_LDFLAGS) | sed -e "s#-L##g"`; \
	fftwld=`echo $(fftw_LDFLAGS) | sed -e "s#-L##g"`; \
	ldstr=`echo "$${blasld} $${lapackld} $${fftwld}" | sed -e "s# #:#g"`; \
	echo "library_dirs = $${ldstr}" >> site.cfg; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		echo "search_static_first = 0" >> site.cfg; \
	else \
		echo "search_static_first = 1" >> site.cfg; \
	fi; \
	echo "" >> site.cfg; \
	echo "[blas_opt]" >> site.cfg; \
	blaslib=`echo $(blas_LIBS_CC) | sed -e "s#-l##g"`; \
	echo "libraries = $${blaslib}" >> site.cfg; \
	echo "" >> site.cfg; \
	echo "[lapack_opt]" >> site.cfg; \
	lapacklib=`echo $(lapack_LIBS_CC) | sed -e "s#-l##g"`; \
	echo "libraries = $${lapacklib}" >> site.cfg; \
	echo "" >> site.cfg; \
	echo "[fftw]" >> site.cfg; \
	fftwlib=`echo $(fftw_LIBS_CC) | sed -e "s#-l##g"`; \
	echo "libraries = $${fftwlib}" >> site.cfg; \
	echo "" >> site.cfg


pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py build


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_VERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



