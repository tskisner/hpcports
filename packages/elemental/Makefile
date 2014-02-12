
include ../pkg_defs.make

# Package parameters

PKG_NAME = elemental

PKG_FORMAT = tar
PKG_TAR = elemental-$(PKG_VERSION).tar.gz
PKG_TAR_FETCH = $(WGET) -O $(HPCP_POOL)/$(PKG_TAR) http://libelemental.org/pub/releases/elemental-$(PKG_VERSION).tgz

PKG_TAR_EXTRACT = $(GXTAR)

PKG_SRCDIR = elemental-$(PKG_VERSION)

PKG_BUILDDIR = build

PKG_PATCHES = hpcp_fortran.patch


# rules for this package

pkg-prefetch :
	@echo "" > /dev/null


pkg-configure :
	@cd $(STAGE); \
	echo "# HPCP toolchain" > hpcp.cmake; \
	echo "#-------------------" >> hpcp.cmake; \
	if [ "x$(BUILD_FORTRAN)" = "xTRUE" ]; then \
		echo "set(HPCP_FORTRAN TRUE)" >> hpcp.cmake; \
	else \
		echo "set(HPCP_FORTRAN FALSE)" >> hpcp.cmake; \
	fi; \
	if [ "x$(OMPFLAGS)" = "x" ]; then \
		echo "set(CMAKE_BUILD_TYPE PureRelease)" >> hpcp.cmake; \
	else \
		echo "set(CMAKE_BUILD_TYPE HybridRelease)" >> hpcp.cmake; \
	fi; \
	echo "# Compilers " >> hpcp.cmake; \
	echo "set(CMAKE_C_COMPILER $(MPICC))" >> hpcp.cmake; \
	echo "set(CMAKE_CXX_COMPILER $(MPICXX))" >> hpcp.cmake; \
	echo "set(CMAKE_Fortran_COMPILER $(MPIFC))" >> hpcp.cmake; \
	echo "set(MPI_C_COMPILER $(MPICC))" >> hpcp.cmake; \
	echo "set(MPI_CXX_COMPILER $(MPICXX))" >> hpcp.cmake; \
	echo "set(MPI_Fortran_COMPILER $(MPIFC))" >> hpcp.cmake; \
	echo "# Compiler flags " >> hpcp.cmake; \
	echo "set(CMAKE_C_FLAGS \"$(CFLAGS)\")" >> hpcp.cmake; \
	echo "set(CMAKE_CXX_FLAGS \"$(CXXFLAGS)\")" >> hpcp.cmake; \
	echo "set(CMAKE_Fortran_FLAGS \"$(FCFLAGS)\")" >> hpcp.cmake; \
	echo "set(C_FLAGS \"$(CFLAGS)\")" >> hpcp.cmake; \
	echo "set(CXX_FLAGS \"$(CXXFLAGS)\")" >> hpcp.cmake; \
	echo "set(Fortran_FLAGS \"$(FCFLAGS)\")" >> hpcp.cmake; \
	echo "set(OpenMP_CXX_FLAGS \"$(OMPFLAGS)\")" >> hpcp.cmake; \
	echo "# Shared libraries " >> hpcp.cmake; \
	if [ "x$(BUILD_DYNAMIC)" = "xTRUE" ]; then \
		echo "set(BUILD_SHARED_LIBS ON)" >> hpcp.cmake; \
		echo "set(SHARED_LIBRARIES ON)" >> hpcp.cmake; \
	else \
		echo "set(BUILD_SHARED_LIBS OFF)" >> hpcp.cmake; \
		echo "set(SHARED_LIBRARIES OFF)" >> hpcp.cmake; \
		echo "set(CMAKE_FIND_LIBRARY_SUFFIXES .a $${CMAKE_FIND_LIBRARY_SUFFIXES})" >> hpcp.cmake; \
		echo "set(CMAKE_EXE_LINKER_FLAGS \"-static\")" >> hpcp.cmake; \
	fi; \
	echo "# lapack and other math libraries " >> hpcp.cmake; \
	math=`echo "$(lapack_LIBS_CXX) $(blas_LIBS_CXX) $(FCLIBS) $(LDFLAGS) $(LIBS)" | sed -e "s#^ *##" -e 's# *$$##' -e 's# #;#g'`; \
	echo "set(MATH_LIBS \"$${math}\")" >> hpcp.cmake; \
	mkdir -p $(PKG_BUILDDIR); \
	cd $(PKG_BUILDDIR); \
	cmake \
	-D CMAKE_TOOLCHAIN_FILE=../hpcp.cmake \
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



