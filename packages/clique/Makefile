
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = clique

PKG_FORMAT = tar
PKG_TAR = clique-$(PKG_VERSION).tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) https://bitbucket.org/poulson/clique/get/default.tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = poulson-clique-$(PKG_VERSION)

PKG_BUILDDIR = build

PKG_PATCHES = hpcp_lapack.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	dyn="-D BUILD_SHARED_LIBS:BOOL=OFF -D SHARED_LIBRARIES:BOOL=OFF -D SHARED:BOOL=OFF"; \
	math=`echo "$(lapack_LIBS_CXX) $(blas_LIBS_CXX) $(FCLIBS) $(LDFLAGS) $(LIBS)" | sed -e "s# #;#g"`; \
	cmake $${dyn} \
	-D CMAKE_C_COMPILER="$(MPICC)" \
	-D CMAKE_CXX_COMPILER="$(MPICXX)" \
	-D CMAKE_Fortran_COMPILER="$(MPIFC)" \
	-D CMAKE_BUILD_TYPE=HybridRelease \
	-D CMAKE_C_FLAGS="$(CFLAGS)" \
	-D C_HYBRID_RELEASE_FLAGS="$(CFLAGS)" \
	-D CMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-D CXX_HYBRID_RELEASE_FLAGS="$(CXXFLAGS)" \
	-D CMAKE_Fortran_FLAGS="$(FCFLAGS)" \
	-D MPI_C_COMPILER="$(MPICC)" \
	-D MPI_CXX_COMPILER="$(MPICXX)" \
	-D MPI_Fortran_COMPILER="$(MPIFC)" \
	-D MPI_Fortran_LIBRARIES="$(MPIFCLIBS)" \
	-D MATH_LIBS="$${math}" \
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



