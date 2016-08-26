
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
#export HPCP_PREFIX=/project/projectdirs/cmb/modules/edison/hpcports_gnu

# OS environment version
#
# For edison, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 5.1.0, craype-2.4.2, cray-mpich 7.2.5
# 1.1 :  same as 1.0, but with different environment setup in hpcp module
# 2.0 :  gnu 5.2.0, craype-2.5.1, cray-mpich 7.3.1
# 2.1 :  same as 2.0, but without actually swapping environment.  do not
#        use compiler wrappers for serial code.
# 3.0 :  gnu 5.3.0, craype-2.5.5, cray-mpich 7.4.0
# 4.0 :  gnu 6.1.0, craype-2.5.5, cray-mpich 7.4.1, intel 16.0.3.210
#

HPCP_ENV = 4.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = TRUE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = cmb
INST_PERM = a+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = cray.mpich
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn
MPICPPFLAGS = /opt/cray/pe/mpt/7.4.1/gni/mpich-gnu/5.1/include
MPILDFLAGS = /opt/cray/pe/mpt/7.4.1/gni/mpich-gnu/5.1/lib
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

FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS =

# Linking

LIBS = -lm
LDFLAGS =
LIBTOOLFLAGS = 

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = $(MKLROOT)
INTEL_INCLUDE = $(INTEL_PREFIX)/include
INTEL_LIBDIR = $(INTEL_PREFIX)/lib/intel64
INTEL_LIBS_CC = -lmkl_rt -fopenmp -lpthread -lm -ldl
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

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

# module load git/2.6.3

git_OVERRIDE = TRUE
git_VERSION = 2.6.3

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
openssl_VERSION = 0.9.8j

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.7

# pkg-config already works

pkgconfig_OVERRIDE = TRUE
pkgconfig_VERSION = sys

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = $(INTEL_VERSION)
blas_PREFIX = $(MKLROOT)
blas_INCLUDE = $(MKLROOT)/include
blas_LIBS_CC = $(INTEL_LIBS_CC)
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = $(INTEL_VERSION)
lapack_PREFIX = $(MKLROOT)
lapack_INCLUDE = $(MKLROOT)/include
lapack_LIBS_CC = -lmkl_lapack95_lp64
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
