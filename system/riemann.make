
HPCP_PREFIX = /clusterfs/riemann/data/kisner/software/hpcports

HPCP_POOL = /clusterfs/riemann/data/kisner/software/hpcports_pool

# OS environment version
#
# For riemann, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL.  Document configuration here:
#
# 1.0 : gcc-4.8.2, MKL 11.0.084
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = users
INST_PERM = g+rX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# general linking

LIBS = -lm -lpthread

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = $(MKL_DIR)
INTEL_INCLUDE = $(INTEL_PREFIX)/include
INTEL_LIBDIR = $(INTEL_PREFIX)/lib/intel64
#INTEL_LIBS_CC = -lmkl_rt
#INTEL_LIBS_CC = -lmkl_rt -lmkl_mc3
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -fopenmp -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

blas_OVERRIDE = TRUE
blas_VERSION = 11.0.084
blas_LIBS_CC = $(INTEL_LIBS_CC) $(FCLIBS)
blas_LIBS_CXX = $(INTEL_LIBS_CXX) $(FCLIBS)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 11.0.084
lapack_LIBS_CC = -lmkl_lapack95_lp64
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.6.1

