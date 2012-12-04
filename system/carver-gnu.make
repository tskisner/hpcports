
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
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

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
openmpi_VERSION = 1.4.5
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
INTEL_INCLUDE = $(MKL_INC)
INTEL_LIBDIR = $(MKL_HOME)/lib/em64t
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lmkl_mc3 -liomp5
INTEL_LIBS_CXX = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lmkl_mc3 -liomp5
INTEL_LIBS_F77 = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lmkl_mc3 -liomp5
INTEL_LIBS_FC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lmkl_mc3 -liomp5

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.4.13

tk_OVERRIDE = TRUE
tk_VERSION = 8.4.13

blas_OVERRIDE = TRUE
blas_PREFIX = $(MKL_HOME)
blas_VERSION = 10.2
blas_LIBS_CC = $(INTEL_LIBS_CC)
blas_LIBS_CXX = $(INTEL_LIBS_CXX)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_PREFIX = $(MKL_HOME)
lapack_VERSION = 10.2
lapack_LIBS_CC = -lmkl_lapack
lapack_LIBS_CXX = -lmkl_lapack
lapack_LIBS_F77 = -lmkl_lapack
lapack_LIBS_FC = -lmkl_lapack

