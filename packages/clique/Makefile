
include ../pkg_defs.make

# Package parameters

PKG_NAME = clique

PKG_FORMAT = git
PKG_GIT_CLONE = git clone --recursive git://github.com/poulson/Clique.git
PKG_GIT_CHECKOUT = git checkout -b hpcports $(PKG_VERSION) >/dev/null 2>&1

PKG_SRCDIR = Clique

PKG_BUILDDIR = build

PKG_PATCHES =


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	stripcxx=`echo $(CXXFLAGS) | sed -e "s#-DNDEBUG##g"`; \
	stripc=`echo $(CFLAGS) | sed -e "s#-DNDEBUG##g"`; \
	stripfc=`echo $(FCFLAGS) | sed -e "s#-DNDEBUG##g"`; \
	dyn="-D BUILD_SHARED_LIBS:BOOL=OFF -D SHARED_LIBRARIES:BOOL=OFF -D SHARED:BOOL=OFF"; \
	math="$(lapack_LIBS_CXX) $(blas_LIBS_CXX) $(FCLIBS) $(LDFLAGS) $(LIBS)"; \
	extracpp="-std=c++11"; \
	if [ "x$(VENDOR)" = "xapple" ]; then \
		extracpp="-std=c++11 -stdlib=libc++"; \
	fi; \
	cmake $${dyn} $${fort} \
	-D CMAKE_C_COMPILER="$(CC)" \
	-D CMAKE_CXX_COMPILER="$(CXX)" \
	-D CMAKE_BUILD_TYPE=HybridRelease \
	-D CMAKE_C_FLAGS="$${stripc}" \
	-D C_PURE_RELEASE_FLAGS="$${stripc}" \
	-D C_HYBRID_RELEASE_FLAGS="$${stripc}" \
	-D CMAKE_CXX_FLAGS="$${stripcxx} $${extracpp}" \
	-D C_FLAGS="$${stripc}" \
	-D CXX_FLAGS="$${stripcxx} $${extracpp}" \
	-D OpenMP_CXX_FLAGS="$(OMPFLAGS)" \
	-D CXX_PURE_RELEASE_FLAGS="$${stripcxx} $${extracpp}" \
	-D CXX_HYBRID_RELEASE_FLAGS="$${stripcxx} $${extracpp}" \
	-D MPI_C="$(MPICC)" \
	-D MPI_CXX="$(MPICXX)" \
	-D CMAKE_Fortran_COMPILER="$(FC)" \
	-D CMAKE_Fortran_FLAGS="$${stripfc}" \
	-D MPI_Fortran="$(MPIFC)" \
	-D MPI_Fortran_LIBRARIES="$(MPIFCLIBS)" \
	-D MATH_LIBS="$${math}" \
	-D CMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	../$(PKG_SRCDIR); \


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

