
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
#export HPCP_PREFIX=/scratch1/scratchdirs/kisner/software/hpcports_gnu

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.6.3, ACML 4.4.0, xt-mpich2 5.4.5, fftw 3.3.0.0, python 2.7.1
# 2.0 : gcc-4.7.1, ACML 4.4.0, cray-mpich2 5.5.2, fftw 3.3.0.0, python 2.7.1
# 3.0 : gcc-4.7.2, ACML 4.4.0, cray-mpich2 5.5.5, fftw 3.3.0.1, python 2.7.3
# 4.0 : gcc-4.7.2, ACML 4.4.0, xt-asyncpe 5.19, cray-mpich2 5.6.4, fftw 3.3.0.2, python 2.7.3
# 5.0 : gcc-4.7.2, ACML 4.4.0, xt-asyncpe 5.23, cray-mpich2 5.6.4, fftw 3.3.0.2, python 2.7.3, darshan 2.2.6
# 6.0 : gcc-4.8.1, ACML 4.4.0, xt-asyncpe 5.23, cray-mpich 6.1.0, fftw 3.3.0.4, python 2.7.5
# 6.1 : same as 6.0, but with new HPCP dependency version hash
# 7.0 : gcc-4.9.2, craype-2.2.1, cray-mpich 7.1.1, cray-libsci 13.0.1, python 2.7.9
#

HPCP_ENV = 7.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

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
openmpi_VERSION = cray.mpich
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn
MPICPPFLAGS = /opt/cray/mpt/7.1.1/gni/mpich2-gnu/49/include
MPILDFLAGS = /opt/cray/mpt/7.1.1/gni/mpich2-gnu/49/lib
MPILIBS = -lmpich
MPICXXLIBS = -lmpichcxx

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS =

# Linking

LIBS = -lpthread -lm
LDFLAGS =
LIBTOOLFLAGS = --preserve-dup-deps

# vendor math libraries


# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.5.5

tk_OVERRIDE = TRUE
tk_VERSION = 8.5.5

termcap_OVERRIDE = TRUE
termcap_VERSION = 2.0.8

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

git_OVERRIDE = TRUE
git_VERSION = 2.3.1

cmake_OVERRIDE = TRUE
cmake_VERSION = 3.1.3

# module load zlib/1.2.8

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.8
zlib_LIBS_CC = -lz
zlib_LIBS_CXX = -lz
zlib_LIBS_F77 = -lz
zlib_LIBS_FC = -lz

# module load bzip2/1.0.6

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8

# module load curl/7.35.0

curl_OVERRIDE = TRUE
curl_VERSION = 7.35.0

# module load python/2.7.9

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.9

nose_OVERRIDE = TRUE
nose_VERSION = 1.1.2

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.6.2

scipy_OVERRIDE = TRUE
scipy_VERSION = 0.11.0

pyfits_OVERRIDE = TRUE
pyfits_VERSION = NA

# module load ipython/0.13.1

ipython_OVERRIDE = TRUE
ipython_VERSION = 0.13.1

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.1.0

# module load mpi4py/1.3

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = 1.3

pyslalib_OVERRIDE = TRUE
pyslalib_VERSION = NA

scientific_OVERRIDE = TRUE
scientific_VERSION = NA

healpy_OVERRIDE = TRUE
healpy_VERSION = NA

numexpr_OVERRIDE = TRUE
numexpr_VERSION = NA

# pkg-config already works

pkgconfig_OVERRIDE = TRUE
pkgconfig_VERSION = sys

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 13.0.1
blas_LIBS_CC = 
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 13.0.1

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 13.0.1

