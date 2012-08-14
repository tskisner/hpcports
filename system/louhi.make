
HPCP_PREFIX = /fs/local/users/pr2f1870/hpcports

# OS environment version
#
# For louhi, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.6.2, ACML 4.4.0, xt-mpich2 5.2.1, fftw 3.2.2.1
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /fs/local/users/pr2f1870/hpcports_pool

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
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn

# compile flags

CFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = /opt/gcc/4.6.2/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.6.2/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = -L/opt/acml/4.4.0/gfortran64_mp/lib -lacml_mp /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a
LDFLAGS = /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a

# vendor math libraries

VENDOR = amd
AMD_CPPFLAGS = -I$(ACML_DIR)/gfortran64_mp/include
AMD_LDFLAGS = -L$(ACML_DIR)/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv /opt/gcc/4.6.2/snos/lib64/libgfortran.a /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_CXX = -lacml_mp -lacml_mv /opt/gcc/4.6.2/snos/lib64/libgfortran.a /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_F77 = -lacml_mp -lacml_mv /opt/gcc/4.6.2/snos/lib64/libgfortran.a /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_FC = -lacml_mp -lacml_mv /opt/gcc/4.6.2/snos/lib64/libgfortran.a /opt/gcc/4.6.2/snos/lib64/libgomp.a /usr/lib64/librt.a

# package overrides

readline_OVERRIDE = TRUE
readline_VERSION = louhi

gzip_OVERRIDE = TRUE
gzip_VERSON = louhi

gettext_OVERRIDE = TRUE
gettext_VERSION = louhi

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.2

zlib_OVERRIDE = TRUE
zlib_VERSION = louhi

openssl_OVERRIDE = TRUE
openssl_VERSION = louhi

curl_OVERRIDE = TRUE
curl_VERSION = louhi

python_OVERRIDE = TRUE
python_SITE = python2.6
python_VERSION = louhi

fftw_OVERRIDE = TRUE
fftw_PREFIX = /opt/fftw/$(FFTW_VERSION)
fftw_VERSION = $(FFTW_VERSION)

nose_OVERRIDE = TRUE
nose_VERSION = louhi

numpy_OVERRIDE = TRUE
numpy_VERSION = louhi

scipy_OVERRIDE = TRUE
scipy_VERSION = louhi

pyfits_OVERRIDE = TRUE
pyfits_VERSION = louhi

ipython_OVERRIDE = TRUE
ipython_VERSION = louhi

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = louhi

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = louhi

pyslalib_OVERRIDE = TRUE
pyslalib_VERSION = louhi

scientific_OVERRIDE = TRUE
scientific_VERSION = louhi

healpy_OVERRIDE = TRUE
healpy_VERSION = louhi

numexpr_OVERRIDE = TRUE
numexpr_VERSION = louhi

# we get BLAS from ACML and Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 4.4.0
blas_CPPFLAGS = $(AMD_CPPFLAGS)
blas_LDFLAGS = $(AMD_LDFLAGS)
blas_LIBS_CC = $(AMD_LIBS_CC)
blas_LIBS_CXX = $(AMD_LIBS_CXX)
blas_LIBS_FC = $(AMD_LIBS_FC)
blas_LIBS_F77 = $(AMD_LIBS_F77)

lapack_OVERRIDE = TRUE
lapack_VERSION = 10.5.01

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 10.5.01

