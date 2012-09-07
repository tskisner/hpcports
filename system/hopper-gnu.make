
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_gnu

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.6.3, ACML 4.4.0, xt-mpich2 5.4.5, fftw 3.3.0.0, python 2.7.1
# 2.0 : gcc-4.7.1, ACML 4.4.0, cray-mpich2 5.5.2, fftw 3.3.0.0, python 2.7.1
#

HPCP_ENV = 2.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = FALSE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = cmb
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

CFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = /opt/gcc/4.7.1/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.7.1/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = -L/opt/acml/4.4.0/gfortran64_mp/lib -lacml_mp /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a
LDFLAGS = -L/usr/lib64 /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a

# vendor math libraries

VENDOR = amd
AMD_CPPFLAGS = -I$(ACML_DIR)/gfortran64_mp/include
AMD_LDFLAGS = -L$(ACML_DIR)/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv /opt/gcc/4.7.1/snos/lib64/libgfortran.a /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_CXX = -lacml_mp -lacml_mv /opt/gcc/4.7.1/snos/lib64/libgfortran.a /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_F77 = -lacml_mp -lacml_mv /opt/gcc/4.7.1/snos/lib64/libgfortran.a /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_FC = -lacml_mp -lacml_mv /opt/gcc/4.7.1/snos/lib64/libgfortran.a /opt/gcc/4.7.1/snos/lib64/libgomp.a /usr/lib64/librt.a

# package overrides

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSON = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.4

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.2

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.3

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.0

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.1

fftw_OVERRIDE = TRUE
fftw_PREFIX = /opt/fftw/$(FFTW_VERSION)
fftw_VERSION = 3.3.0.0

nose_OVERRIDE = TRUE
nose_VERSION = NA

astropy_OVERRIDE = TRUE
astropy_VERSION = NA

pyraf_OVERRIDE = TRUE
pyraf_VERSION = NA

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
lapack_VERSION = 11.1.00

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 11.1.00

