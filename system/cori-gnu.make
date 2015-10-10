
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
#

HPCP_ENV = 1.0

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
MPICPPFLAGS = /opt/cray/mpt/7.2.5/gni/mpich2-GNU/5.1/include
MPILDFLAGS = /opt/cray/mpt/7.2.5/gni/mpich2-GNU/5.1/lib
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

LIBS = -lm
LDFLAGS =
LIBTOOLFLAGS = 

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016.0.109/linux
INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -fopenmp -lpthread -lm
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

git_OVERRIDE = TRUE
git_VERSION = 1.7.12.4

# module load zlib/1.2.7

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.7
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
blas_VERSION = 2016.0.047
blas_PREFIX = /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016.0.109/linux/mkl
blas_INCLUDE = /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016.0.109/linux/mkl/include
blas_LIBS_CC = $(INTEL_LIBS_CC)
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 2016.0.047
lapack_PREFIX = /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016.0.109/linux/mkl
lapack_INCLUDE = /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016.0.109/linux/mkl/include
lapack_LIBS_CC = -lmkl_lapack95_lp64
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
