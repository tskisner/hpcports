
# OS environment version
#
# For carver, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-4.7.0, MKL 10.2, OpenMPI 1.4.5
#

HPCP_ENV = 1.0

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

MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O0 -g -fPIC
CXXFLAGS = -O0 -g -fPIC
FFLAGS = -O0 -g -fPIC
FCFLAGS = -O0 -g -fPIC

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# vendor math libraries

VENDOR = intel
INTEL_CPPFLAGS = -I$(MKL_INC)
INTEL_LDFLAGS = -L$(MKL_HOME)/lib/em64t
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
INTEL_LIBS_CXX = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
INTEL_LIBS_F77 = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
INTEL_LIBS_FC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread

# package overrides

python_OVERRIDE = TRUE
python_VERSION = 2.7.1

blas_OVERRIDE = TRUE
blas_PREFIX = $(MKL_HOME)
blas_VERSION = 10.2
blas_LDFLAGS = -L$(MKL_HOME)/lib/em64t
blas_LIBS_CC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
blas_LIBS_CXX = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
blas_LIBS_F77 = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
blas_LIBS_FC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread

