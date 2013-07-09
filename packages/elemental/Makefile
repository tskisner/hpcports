
include ../pkg_defs.make

# Package parameters

PKG_NAME = elemental

PKG_FORMAT = git
PKG_GIT_CLONE = git clone git://github.com/poulson/Elemental.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = Elemental

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
	-D CMAKE_C_COMPILER="$(CC)" \
	-D CMAKE_CXX_COMPILER="$(CXX)" \
	-D CMAKE_Fortran_COMPILER="$(FC)" \
	-D CMAKE_BUILD_TYPE=PureRelease \
	-D CMAKE_C_FLAGS="$(CFLAGS)" \
	-D C_PURE_RELEASE_FLAGS="$(CFLAGS)" \
	-D C_HYBRID_RELEASE_FLAGS="$(CFLAGS)" \
	-D CMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-D CXX_PURE_RELEASE_FLAGS="$(CXXFLAGS)" \
	-D CXX_HYBRID_RELEASE_FLAGS="$(CXXFLAGS)" \
	-D CMAKE_Fortran_FLAGS="$(FCFLAGS)" \
	-D MPI_C_COMPILER="$(MPICC)" \
	-D MPI_CXX_COMPILER="$(MPICXX)" \
	-D MPI_Fortran_COMPILER="$(MPIFC)" \
	-D MPI_Fortran_LIBRARIES="$(MPIFCLIBS)" \
	-D MATH_LIBS="$${math}" \
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



