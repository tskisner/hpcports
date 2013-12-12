
include ../pkg_defs.make

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
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	echo "[DEFAULT]" > site.cfg; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		echo "search_static_first = 0" >> site.cfg; \
	else \
		echo "search_static_first = 1" >> site.cfg; \
	fi; \
	echo "" >> site.cfg; \
	if [ "x$(VENDOR)" = "xintel" ]; then \
		echo "[mkl]" >> site.cfg; \
		inteldir=`echo $(INTEL_LIBDIR)`; \
		echo "library_dirs = $${inteldir}" >> site.cfg; \
		intellib=`echo $(INTEL_LIBS_CC) | sed -e "s#-l##g" -e "s# #,#g"`; \
		echo "mkl_libs = $${intellib}" >> site.cfg; \
		lapacklib=`echo $(lapack_LIBS_CC) | sed -e "s#-l##g" -e "s# #,#g"`; \
		echo "lapack_libs = $${lapacklib}" >> site.cfg; \
		echo "" >> site.cfg; \
	else if [ "x$(VENDOR)" = "xapple" ]; then \
		echo "" >> site.cfg; \
	else \
		echo "[blas]" >> site.cfg; \
		echo "language = f77" >> site.cfg; \
		echo "library_dirs = $(blas_PREFIX)/lib" >> site.cfg; \
		blaslib=`echo $(blas_LIBS_CC) | sed -e "s#-l##g" -e "s# #,#g"`; \
		echo "blas_libs = $${blaslib}" >> site.cfg; \
		echo "" >> site.cfg; \
		echo "[lapack]" >> site.cfg; \
		echo "language = f77" >> site.cfg; \
		echo "library_dirs = $(lapack_PREFIX)/lib" >> site.cfg; \
		lapacklib=`echo $(lapack_LIBS_CC) | sed -e "s#-l##g" -e "s# #,#g"`; \
		echo "lapack_libs = $${lapacklib}" >> site.cfg; \
		echo "" >> site.cfg; \
	fi; \
	fi; \
	echo "[fftw]" >> site.cfg; \
	fftwlib=`echo $(fftw_LIBS_CC) | sed -e "s#-l##g" -e "s# #,#g"`; \
	echo "fftw_libs = $${fftwlib}" >> site.cfg; \
	echo "" >> site.cfg

# Numpy LDFLAGS *OVERRIDES* the default, so we must pass "-shared".
# I am not sure how portable this is...

pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export ATLAS=None; export OPT="$(CFLAGS) $(OMPFLAGS)"; export FOPT="$(FFLAGS) $(OMPFLAGS)"; export LDFLAGS="-shared $(LDFLAGS) $(FCLIBS) $(OMPFLAGS) $(LIBS)"; python setup.py build


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	export ATLAS=None; export PYTHONPATH="$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)/lib/$(python_SITE)/site-packages:$(PYTHONPATH)"; export OPT="$(CFLAGS) $(OMPFLAGS)"; export FOPT="$(FFLAGS) $(OMPFLAGS)"; export LDFLAGS="-shared $(LDFLAGS) $(FCLIBS) $(OMPFLAGS) $(LIBS)"; python setup.py install --prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	python setup.py clean


# Include common package rules

include ../pkg.make



