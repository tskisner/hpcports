
HPCP_PREFIX = /proj/planck/software/hpcports

# OS environment version
#
# For edison, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.3, cray-mpich2 5.6.5, mkl-13.5.192
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /proj/planck/software/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = FALSE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = pr2fg002
INST_PERM = g+rwX,o+rX

# serial compilers

CC = cc
CXX = CC
F77 = ftn
FC = ftn

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = cray.mpich2
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn

# compile flags

CFLAGS = -O3 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -static -fPIC -DNDEBUG
FFLAGS = -O3 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing
FLIBS = /opt/gcc/4.7.3/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.7.3/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = -lm
LDFLAGS =
LIBTOOLFLAGS = --preserve-dup-deps

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = /opt/intel/composer_xe_2013.5.192
INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
INTEL_LIBS_CC = $(INTEL_LIBDIR)/libmkl_intel_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a $(INTEL_LIBDIR)/libmkl_intel_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a $(INTEL_LIBDIR)/libmkl_intel_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a -ldl -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.8.1.4

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8j

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.7

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = NA

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.10.2

nose_OVERRIDE = TRUE
nose_VERSION = NA

numpy_OVERRIDE = TRUE
numpy_VERSION = NA

scipy_OVERRIDE = TRUE
scipy_VERSION = NA

pyfits_OVERRIDE = TRUE
pyfits_VERSION = NA

ipython_OVERRIDE = TRUE
ipython_VERSION = NA

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = NA

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = NA

pyslalib_OVERRIDE = TRUE
pyslalib_VERSION = NA

scientific_OVERRIDE = TRUE
scientific_VERSION = NA

healpy_OVERRIDE = TRUE
healpy_VERSION = NA

numexpr_OVERRIDE = TRUE
numexpr_VERSION = NA

# we get BLAS and Lapack from MKL

blas_OVERRIDE = TRUE
blas_VERSION = 13.5.192
blas_LIBS_CC = $(INTEL_LIBS_CC)
blas_LIBS_CXX = $(INTEL_LIBS_CXX)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 13.5.192
lapack_LIBS_CC = $(INTEL_LIBDIR)/libmkl_lapack95_lp64.a
lapack_LIBS_CXX = $(INTEL_LIBDIR)/libmkl_lapack95_lp64.a
lapack_LIBS_F77 = $(INTEL_LIBDIR)/libmkl_lapack95_lp64.a
lapack_LIBS_FC = $(INTEL_LIBDIR)/libmkl_lapack95_lp64.a

