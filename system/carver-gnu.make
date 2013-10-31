
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/carver/hpcports_gnu

# OS environment version
#
# For carver, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-4.7.0, MKL 10.2, OpenMPI 1.4.5
# 2.0 : gcc-4.7.0, MKL 13.0.1, OpenMPI 1.6.3
#

HPCP_ENV = 2.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = cmb
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.6.3
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O3 -g -march=native -fPIC -DNDEBUG
CXXFLAGS = -O3 -g -march=native -fPIC -DNDEBUG
FFLAGS = -O3 -g -march=native -fPIC -DNDEBUG
FCFLAGS = -O3 -g -march=native -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# general linking

LIBS = -lm -lpthread

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = /usr/common/usg/intel/13.0.028/composer_xe_2013.1.117
INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
#INTEL_LIBS_CC = -lmkl_rt
INTEL_LIBS_CC = -lmkl_rt -lmkl_mc3
#INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.4.13

tk_OVERRIDE = TRUE
tk_VERSION = 8.4.13

blas_OVERRIDE = TRUE
blas_VERSION = 13.0.1
blas_LIBS_CC = $(INTEL_LIBS_CC) $(FCLIBS)
blas_LIBS_CXX = $(INTEL_LIBS_CXX) $(FCLIBS)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 13.0.1
lapack_LIBS_CC = -lmkl_lapack95_lp64
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.8.3

