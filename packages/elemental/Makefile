
include ../pkg_defs.make

# Package parameters

PKG_NAME = elemental

PKG_FORMAT = tar
PKG_TAR = elemental-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://libelemental.org/pub/releases/elemental-$(PKG_VERSION).tgz

PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = elemental-$(PKG_VERSION)

PKG_BUILDDIR = build

PKG_PATCHES = 


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	build="HybridRelease"; \
	if [ "x$(OMPFLAGS)" = "x" ]; then \
		build="PureRelease"; \
	fi; \
	shared="-D BUILD_SHARED_LIBS:BOOL=ON -D SHARED_LIBRARIES:BOOL=ON"; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		shared="-D BUILD_SHARED_LIBS:BOOL=OFF -D SHARED_LIBRARIES:BOOL=OFF -D CMAKE_EXE_LINKER_FLAGS=-static -D CMAKE_FIND_LIBRARY_SUFFIXES=.a"; \
	fi; \
	math=`echo "$(lapack_LIBS_CXX) $(blas_LIBS_CXX) $(FCLIBS) $(LDFLAGS) $(LIBS)" | sed -e "s#^ *##" -e 's# *$$##' -e 's# #;#g'`; \
	cmake $${shared} \
	-D CMAKE_BUILD_TYPE=$${build} \
	-D CMAKE_C_COMPILER=$(MPICC) \
	-D CMAKE_CXX_COMPILER=$(MPICXX) \
	-D CMAKE_Fortran_COMPILER=$(MPIFC) \
	-D MPI_C_COMPILER=$(MPICC) \
	-D MPI_CXX_COMPILER=$(MPICXX) \
	-D MPI_Fortran_COMPILER=$(MPIFC) \
	-D CMAKE_C_FLAGS="$(CFLAGS)" \
	-D CMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-D CMAKE_Fortran_FLAGS="$(FCFLAGS)" \
	-D C_FLAGS="$(CFLAGS)" \
	-D CXX_FLAGS="$(CXXFLAGS)" \
	-D Fortran_FLAGS="$(FCFLAGS)" \
	-D OpenMP_CXX_FLAGS="$(OMPFLAGS)" \
	-D MATH_LIBS="$${math}" \
	-D ELEM_TESTS:BOOL=ON \
	-D CMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
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



