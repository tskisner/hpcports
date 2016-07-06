
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
# 3.0 : gcc-4.9.0 / binutils 2.24, MKL 13.0.1
# 4.0 : gcc-4.7.0, MKL 13.0.1, OpenMPI 1.4.5
#

HPCP_ENV = 4.0

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

# compile flags.  The fgnu89-inline option is to work around a conflict with
# the (ancient) glibc in redhat 5 mixed with the newer gcc we are using when
# run in -std=gnu99 mode.

CFLAGS = -O3 -g -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -g -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -g -fPIC -DNDEBUG
FCFLAGS = -O3 -g -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.4.5
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90
#MPICPPFLAGS = /usr/common/usg/openmpi/1.8.1/gcc/include
#MPILDFLAGS = /usr/common/usg/openmpi/1.8.1/gcc/lib
#MPILIBS = -lmpi
#MPICXXLIBS = -lmpicxx

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
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -fopenmp -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

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

git_OVERRIDE = TRUE
git_VERSION = 1.7.8.3

