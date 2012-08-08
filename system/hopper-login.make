
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_login

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.3.4, ACML 4.4.0, fftw 3.3.0.0
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

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
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 =
FC =

# MPI compilers

MPICC =
MPICXX =
MPIF77 =
MPIFC =

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG
FFLAGS =
FCFLAGS =

# OpenMP flags

OMPFLAGS =

# Fortran mixing

FLIBS =
FCLIBS =
MPIFCLIBS =

# Linking

LIBS =
LDFLAGS =

# vendor math libraries

VENDOR = amd
AMD_CPPFLAGS = -I$(ACML_DIR)/gfortran64/include
AMD_LDFLAGS = -L$(ACML_DIR)/gfortran64/lib
AMD_LIBS_CC = -lacml -lacml_mv
AMD_LIBS_CXX = -lacml -lacml_mv
AMD_LIBS_F77 = -lacml -lacml_mv
AMD_LIBS_FC = -lacml -lacml_mv

# package overrides

blas_OVERRIDE = TRUE
blas_VERSION = 4.4.0
blas_CPPFLAGS = $(AMD_CPPFLAGS)
blas_LDFLAGS = $(AMD_LDFLAGS)
blas_LIBS_CC = $(AMD_LIBS_CC)
blas_LIBS_CXX = $(AMD_LIBS_CXX)
blas_LIBS_FC = $(AMD_LIBS_FC)
blas_LIBS_F77 = $(AMD_LIBS_F77)

