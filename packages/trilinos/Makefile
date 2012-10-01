
# System configuration

include ../../system/$(HPCP_TARGET).make
include ../../system/defaults.make

# Package version

PKG_VERSION := $(shell head -n 1 version)

# Package parameters

PKG_NAME = trilinos

PKG_FORMAT = tar
PKG_TAR = trilinos-$(PKG_VERSION)-Source.tar.bz2
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://trilinos.sandia.gov/download/files/trilinos-10.12.2-Source.tar.bz2
PKG_TAR_EXTRACT = $(BXTAR)

PKG_SRCDIR = trilinos-$(PKG_VERSION)-Source

PKG_BUILDDIR = build

PKG_PATCHES = hpcp_fortran_link.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	dyn=""; \
	if [ "x$(VENDOR)" == "xapple" ]; then \
		dyn="-D BUILD_SHARED_LIBS:BOOL=ON -D CMAKE_SHARED_LINKER_FLAGS:STRING="-Wl,-flat_namespace,-undefined,warning" -D MPI4PY_INCLUDE_DIR:PATH=$(mpi4py_PREFIX)/lib/$(python_SITE)/site-packages/mpi4py/include"; \
	else \
		dyn="-D BUILD_SHARED_LIBS:BOOL=ON -D MPI4PY_INCLUDE_DIR:PATH=$(mpi4py_PREFIX)/lib/$(python_SITE)/site-packages/mpi4py/include"; \
	fi; \
	if [ "x$(BUILD_DYNAMIC)" != "xTRUE" ]; then \
		dyn="-D BUILD_SHARED_LIBS:BOOL=OFF -D TPL_FIND_SHARED_LIBS:BOOL=OFF -D Trilinos_LINK_SEARCH_START_STATIC:BOOL=ON -D Trilinos_ENABLE_PyTrilinos:BOOL=OFF"; \
	fi; \
	lapblas=""; \
	if [ "x$(VENDOR)" != "xapple" ]; then \
		blasinc=`echo $(blas_CPPFLAGS) | sed -e "s#-I##g"`; \
		blasld=`echo $(blas_LDFLAGS) | sed -e "s#-L##g"`; \
		blaslib=`echo $(blas_LIBS_CXX) | sed -e "s#-l##g" -e "s# #;#g"`; \
		lapackinc=`echo $(lapack_CPPFLAGS) | sed -e "s#-I##g"`; \
		lapackld=`echo $(lapack_LDFLAGS) | sed -e "s#-L##g"`; \
		lapacklib=`echo $(lapack_LIBS_CXX) | sed -e "s#-l##g" -e "s# #;#g"`; \
		lapblas="-D BLAS_INCLUDE_DIRS:PATH=$${blasinc} -D BLAS_LIBRARY_DIRS:PATH=$${blasld} -D BLAS_LIBRARY_NAMES:STRING=$${blaslib} -D LAPACK_INCLUDE_DIRS:PATH=$${lapackinc} -D LAPACK_LIBRARY_DIRS:PATH=$${lapackld} -D LAPACK_LIBRARY_NAMES:STRING=$${lapacklib}"; \
	fi; \
	scal=""; \
	if [ "x$(scalapack_LIBS_MPICXX)" != "x" ]; then \
		scalapackinc=`echo $(scalapack_CPPFLAGS) | sed -e "s#-I##g"`; \
		scalapackld=`echo $(scalapack_LDFLAGS) | sed -e "s#-L##g"`; \
		scalapacklib=`echo $(scalapack_LIBS_MPICXX) | sed -e "s#-l##g" -e "s# #;#g"`; \
		scal="-D SCALAPACK_INCLUDE_DIRS:PATH=$${scalapackinc} -D SCALAPACK_LIBRARY_DIRS:PATH=$${scalapackld} -D SCALAPACK_LIBRARY_NAMES:STRING=$${scalapacklib}"; \
	fi; \
	cmake $${dyn} \
	-D Trilinos_VERBOSE_CONFIGURE:BOOL=ON \
	-D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
	-D Trilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
	-D Trilinos_ENABLE_SECONDARY_STABLE_CODE:BOOL=ON \
	-D Trilinos_ENABLE_TriKota:BOOL=OFF \
	-D CMAKE_BUILD_TYPE:STRING=RELEASE \
	-D CMAKE_C_FLAGS_RELEASE_OVERRIDE:STRING="$(CFLAGS)" \
	-D CMAKE_CXX_FLAGS_RELEASE_OVERRIDE:STRING="$(CXXFLAGS)" \
	-D CMAKE_Fortran_FLAGS_RELEASE_OVERRIDE:STRING="$(FCFLAGS)" \
	-D CMAKE_EXE_LINKER_FLAGS:STRING="$(LDFLAGS) $(LIBS) $(FCLIBS)" \
	-D Trilinos_ENABLE_OpenMP:BOOL=ON \
	-D TPL_ENABLE_MKL:BOOL=OFF \
	-D TPL_ENABLE_yaml-cpp:BOOL=OFF \
	-D TPL_ENABLE_Peano:BOOL=OFF \
	-D TPL_ENABLE_CUDA:BOOL=OFF \
	-D TPL_ENABLE_CUSPARSE:BOOL=OFF \
	-D TPL_ENABLE_Thrust:BOOL=OFF \
	-D TPL_ENABLE_Cusp:BOOL=OFF \
	-D TPL_ENABLE_TBB:BOOL=OFF \
	-D TPL_ENABLE_Pthread:BOOL=ON \
	-D TPL_ENABLE_HWLOC:BOOL=OFF \
	-D TPL_ENABLE_BinUtils:BOOL=OFF \
	-D TPL_ENABLE_ARPREC:BOOL=OFF \
	-D TPL_ENABLE_QD:BOOL=OFF \
	-D TPL_ENABLE_MPI:BOOL=ON \
	-D MPI_C_COMPILER:FILEPATH="$(MPICC)" \
	-D MPI_CXX_COMPILER:FILEPATH="$(MPICXX)" \
	-D MPI_Fortran_COMPILER:FILEPATH="$(MPIFC)" \
	-D TPL_ENABLE_BLAS:BOOL=ON \
	-D TPL_ENABLE_LAPACK:BOOL=ON $${lapblas} \
	-D TPL_ENABLE_Boost:BOOL=ON \
	-D Boost_INCLUDE_DIRS:PATH="$(boost_PREFIX)/include" \
	-D Boost_LIBRARY_DIRS:PATH="$(boost_PREFIX)/lib" \
	-D TPL_ENABLE_Scotch:BOOL=OFF \
	-D TPL_ENABLE_OVIS:BOOL=OFF \
	-D TPL_ENABLE_METIS:BOOL=OFF \
	-D TPL_ENABLE_ParMETIS:BOOL=OFF \
	-D TPL_ENABLE_PaToH:BOOL=OFF \
	-D TPL_ENABLE_CppUnit:BOOL=OFF \
	-D TPL_ENABLE_ADOLC:BOOL=OFF \
	-D TPL_ENABLE_ADIC:BOOL=OFF \
	-D TPL_ENABLE_TVMET:BOOL=OFF \
	-D TPL_ENABLE_MF:BOOL=OFF \
	-D TPL_ENABLE_ExodusII:BOOL=OFF \
	-D TPL_ENABLE_Nemesis:BOOL=OFF \
	-D TPL_ENABLE_XDMF:BOOL=OFF \
	-D TPL_ENABLE_Netcdf:BOOL=ON \
	-D Netcdf_INCLUDE_DIRS:PATH="$(netcdf_PREFIX)/include" \
	-D Netcdf_LIBRARY_DIRS:PATH="$(netcdf_PREFIX)/lib" \
	-D TPL_ENABLE_y12m:BOOL=OFF \
	-D TPL_ENABLE_SuperLUDist:BOOL=OFF \
	-D TPL_ENABLE_SuperLU:BOOL=OFF \
	-D TPL_ENABLE_Zlib:BOOL=ON \
	-D TPL_ENABLE_UMFPACK:BOOL=OFF \
	-D TPL_ENABLE_MA28:BOOL=OFF \
	-D TPL_ENABLE_AMD:BOOL=OFF \
	-D TPL_ENABLE_CSparse:BOOL=OFF \
	-D TPL_ENABLE_PETSC:BOOL=OFF \
	-D TPL_ENABLE_HYPRE:BOOL=OFF \
	-D TPL_ENABLE_BLACS:BOOL=OFF \
	-D TPL_ENABLE_SCALAPACK:BOOL=ON $${scal} \
	-D TPL_ENABLE_MUMPS:BOOL=OFF \
	-D TPL_ENABLE_PARDISO_MKL:BOOL=OFF \
	-D TPL_ENABLE_Oski:BOOL=OFF \
	-D TPL_ENABLE_TAUCS:BOOL=OFF \
	-D TPL_ENABLE_ForUQTK:BOOL=OFF \
	-D TPL_ENABLE_Dakota:BOOL=OFF \
	-D TPL_ENABLE_HIPS:BOOL=OFF \
	-D TPL_ENABLE_HDF5:BOOL=OFF \
	-D TPL_ENABLE_MATLAB:BOOL=OFF \
	-D TPL_ENABLE_CASK:BOOL=OFF \
	-D TPL_ENABLE_SPARSKIT:BOOL=OFF \
	-D TPL_ENABLE_QT:BOOL=OFF \
	-D TPL_ENABLE_gtest:BOOL=OFF \
	-D TPL_ENABLE_BoostLib:BOOL=OFF \
	-D TPL_ENABLE_OpenNURBS:BOOL=OFF \
	-D TPL_ENABLE_Portals:BOOL=OFF \
	-D TPL_ENABLE_CrayPortals:BOOL=OFF \
	-D TPL_ENABLE_Gemini:BOOL=OFF \
	-D TPL_ENABLE_InfiniBand:BOOL=OFF \
	-D TPL_ENABLE_Pablo:BOOL=OFF \
	-D TPL_ENABLE_Pnetcdf:BOOL=OFF \
	-D TPL_ENABLE_Clp:BOOL=OFF \
	-D TPL_ENABLE_GLPK:BOOL=OFF \
	-D TPL_ENABLE_qpOASES:BOOL=OFF \
	-D TPL_ENABLE_Matio:BOOL=OFF \
	-D TPL_ENABLE_PAPI:BOOL=OFF \
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



