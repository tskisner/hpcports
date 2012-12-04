
HPCP_PREFIX = /fs/local/users/pr2f5035/hpcports_login

# OS environment version
#
# For louhi, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.5.2, ACML 4.4.0, xt-mpich2 5.2.1, fftw 3.2.2.1
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /fs/local/users/pr2f5035/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = TRUE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = pr2fg002
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG
FFLAGS = -O3 -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LIBS = -lm
LDFLAGS =

# vendor math libraries

VENDOR = amd
AMD_INCLUDE = $(ACML_DIR)/gfortran64_mp/include
AMD_LIBDIR = $(ACML_DIR)/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv
AMD_LIBS_CXX = -lacml_mp -lacml_mv
AMD_LIBS_F77 = -lacml_mp -lacml_mv
AMD_LIBS_FC = -lacml_mp -lacml_mv

# package overrides

readline_OVERRIDE = TRUE
readline_VERSION = louhi

gzip_OVERRIDE = TRUE
gzip_VERSON = louhi

gettext_OVERRIDE = TRUE
gettext_VERSION = louhi

zlib_OVERRIDE = TRUE
zlib_VERSION = louhi

openssl_OVERRIDE = TRUE
openssl_VERSION = louhi

fftw_OVERRIDE = TRUE
fftw_PREFIX = /opt/fftw/$(FFTW_VERSION)
fftw_VERSION = $(FFTW_VERSION)
fftw_LIBS_CC = -lfftw3_threads -lfftw3
fftw_LIBS_CC = -lfftw3_threads -lfftw3
fftw_LIBS_F77 = -lfftw3f_threads -lfftw3_threads -lfftw3f -lfftw3
fftw_LIBS_FC = -lfftw3f_threads -lfftw3_threads -lfftw3f -lfftw3

# we get BLAS from ACML

blas_OVERRIDE = TRUE
blas_VERSION = 4.4.0
blas_LIBS_CC = $(AMD_LIBS_CC)
blas_LIBS_CXX = $(AMD_LIBS_CXX)
blas_LIBS_FC = $(AMD_LIBS_FC)
blas_LIBS_F77 = $(AMD_LIBS_F77)


