
HPCP_PREFIX = /proj/planck/software/hpcports_login

# OS environment version
#
# For edison, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.3, cray-mpich2 5.6.5, mkl-13.5.192
# 2.0 :  gnu 4.8.1, cray-mpich2 6.0.2, craype 1.06, mkl 13.5.192
#

HPCP_ENV = 2.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /proj/planck/software/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

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

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran

# Linking

LIBS = -lm -lpthread
LDFLAGS =

# vendor math libraries

# MKL just doesn't work...

#VENDOR = intel
#INTEL_PREFIX = /opt/intel/composer_xe_2013.5.192
#INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
#INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
#INTEL_LIBS_CC = -lmkl_def -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lmkl_mc3
#INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
#INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
#INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

git_OVERRIDE = TRUE
git_VERSION = 1.8.1.4

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8j

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.7

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.10.2

# we get BLAS and Lapack from MKL- if they only worked...

#blas_OVERRIDE = TRUE
#blas_VERSION = 13.5.192
#blas_LIBS_CC = $(INTEL_LIBS_CC)
#blas_LIBS_CXX = $(INTEL_LIBS_CXX)
#blas_LIBS_F77 = $(INTEL_LIBS_F77)
#blas_LIBS_FC = $(INTEL_LIBS_FC)

#lapack_OVERRIDE = TRUE
#lapack_VERSION = 13.5.192
#lapack_LIBS_CC = -lmkl_lapack95_lp64
#lapack_LIBS_CXX = $(lapack_LIBS_CC)
#lapack_LIBS_F77 = $(lapack_LIBS_CC)
#lapack_LIBS_FC = $(lapack_LIBS_CC)

