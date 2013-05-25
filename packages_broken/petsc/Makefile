
include ../pkg_defs.make

# Package parameters

PKG_NAME = petsc

PKG_FORMAT = tar
PKG_TAR = petsc-lite-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-$(PKG_VERSION).tar.gz
PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = petsc-$(PKG_VERSION)

PKG_BUILDDIR = $(PKG_SRCDIR)

PKG_PATCHES = hpcp_osx_config.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	dyn="--with-shared-libraries=1"; \
	pytools=""; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="--with-shared-libraries=0"; \
		pytools="--with-mpi4py=1 --with-numpy=1"; \
	fi; \
	lapblas=""; \
	if [ "x$(VENDOR)" != "xapple" ]; then \
		blaslib=`echo $(blas_LIBS_CC) | sed -e "s#-l##g"`; \
		blas=""; \
		for lib in $${blaslib}; do \
			blas="lib$${lib}.a,"; \
		done; \
		lapacklib=`echo $(lapack_LIBS_CC) | sed -e "s#-l##g"`; \
		lap=""; \
		for lib in $${lapacklib}; do \
			lap="lib$${lib}.a,"; \
		done; \
		lapblas=`echo "--with-blas-lib=[$${blas%?}] --with-lapack-lib=[$${lap%?}]"`; \
	fi; \
	scallib=`echo $(scalapack_LIBS_MPICC) | sed -e "s#-l##g"`; \
	scal=""; \
	for lib in $${scallib}; do \
		scal="lib$${lib}.a,"; \
	done; \
	scallink=`echo "--with-scalapack-lib=[$${scal%?}]"`; \
	./configure $${dyn} $${pytools} \
	--with-make="$(MAKE)" \
	--with-clanguage=C \
	--with-c++-support=1 \
	--with-fortran=1 \
	--with-fortran-interfaces=1 \
	--with-precision=double \
	--with-scalar-type=real \
	--with-cmake=cmake \
	--with-cc="$(MPICC)" \
	--CFLAGS="$(CFLAGS)" \
	--CC_LINKER_FLAGS="$(MPIFCLIBS) $(FCLIBS)" \
	--with-cxx="$(MPICXX)" \
	--CXXFLAGS="$(CXXFLAGS)" \
	--CXX_LINKER_FLAGS="$(MPIFCLIBS) $(FCLIBS)" \
	--with-fc="$(MPIFC)" \
	--FFLAGS="$(FCFLAGS)" \
	--LDFLAGS="$(LDFLAGS)" \
	--LIBS="$(LIBS)" \
	--with-pic=1 \
	--with-mpi=1 \
	--with-mpi-compilers=1 $${lapblas} \
	--with-expat=1 \
	--with-expat-dir="$(expat_PREFIX)" \
	--with-fftw=1 \
	--with-fftw-dir="$(fftw_PREFIX)" \
	--with-blacs=1 \
	--with-scalapack=1 $${scallink} \
	--with-openmp=1 \
	--with-boost=1 \
	--with-boost-dir="$(boost_PREFIX)" \
	--prefix=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION)


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



