
HPCP_PREFIX = /proj/planck/software/hpcports

# OS environment version
#
# For sisu, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.3, cray-mpich2 5.6.5, mkl-13.5.192
# 2.0 :  gnu 4.8.1, cray-mpich2 6.0.2, craype 1.06, mkl 13.5.192
# 3.0 :  gnu 4.8.2, cray-mpich 6.2.1, craype 2.04, libsci 12.1.3
# 4.0 :  gnu 4.8.2, cray-mpich 6.3.0, craype 2.1.0, libsci 12.2.0, fftw/3.3.0.4
# 5.0 :  gnu 4.9.0, cray-mpich 7.0.0, craype 2.1.2, libsci 13.0.0, fftw/3.3.4.0
#

HPCP_ENV = 5.0

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
openmpi_VERSION = cray.mpich
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn
MPILIBS = -lmpich
MPICXXLIBS = -lmpichcxx

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing
FLIBS = /opt/gcc/4.8.2/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.8.2/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = /opt/gcc/4.8.2/snos/lib64/libgomp.a /usr/lib64/librt.a -lpthread -lm
LDFLAGS =
LIBTOOLFLAGS = 

# vendor math libraries

VENDOR = 

# package overrides

git_OVERRIDE = TRUE
git_VERSION = 1.8.1.4

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

setuptools_OVERRIDE = TRUE
setuptools_VERSION = NA

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 12.2.0
blas_LIBS_CC =
#blas_LIBS_CC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.8.2/snos/lib64/libgfortran.a /opt/gcc/4.8.2/snos/lib64/libgomp.a -ldl
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 12.2.0

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 12.2.0

