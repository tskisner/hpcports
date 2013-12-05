
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
#PKG_PATCHES = hpcp_lapack.patch


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
	fort="-D CMAKE_Fortran_COMPILER=\"$(FC)\" -D CMAKE_Fortran_FLAGS=\"$${stripfc}\" -D MPI_Fortran=\"$(MPIFC)\" -D MPI_Fortran_LIBRARIES=\"$(MPIFCLIBS)\""; \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		fort="-D FORTRAN_WORKS:BOOL=OFF"; \
	fi; \
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
	-D MATH_LIBS="$${math}" \
	-D CMAKE_INSTALL_PREFIX=$(HPCP_PREFIX)/$(PKG_NAME)-$(PKG_FULLVERSION) \
	../$(PKG_SRCDIR); \




pkg-build :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		printf "%s%15s :  FORTRAN Disabled, skipping build\n" "$(HPCP)" "$(PKG_NAME)"; \
	else \
		$(MAKE); \
	fi


pkg-install :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	if [ "x$(BUILD_FORTRAN)" = "xFALSE" ]; then \
		printf "%s%15s :  FORTRAN Disabled, skipping install\n" "$(HPCP)" "$(PKG_NAME)"; \
	else \
		$(MAKE) install; \
	fi


pkg-clean :
	@cd $(STAGE)/$(PKG_BUILDDIR); \
	$(MAKE) clean


# Include common package rules

include ../pkg.make



