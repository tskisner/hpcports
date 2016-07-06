
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/carver/hpcports_sl6

# OS environment version
#
# For carver, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-4.8.3, MKL 14.0.2, OpenMPI 1.8.1
#

HPCP_ENV = 1.0

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
openmpi_VERSION = 1.8.1
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90
#MPILIBS = -lmpi
#MPICXXLIBS = -lmpicxx

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_usempi -lmpi_mpifh

# general linking

LIBS = -lm -lpthread

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = $(MKL_HOME)
INTEL_INCLUDE = $(INTEL_PREFIX)/include
INTEL_LIBDIR = $(INTEL_PREFIX)/lib/intel64
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -fopenmp -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

blas_OVERRIDE = TRUE
blas_VERSION = 14.0.2
blas_LIBS_CC = $(INTEL_LIBS_CC) $(FCLIBS)
blas_LIBS_CXX = $(INTEL_LIBS_CXX) $(FCLIBS)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 14.0.2
lapack_LIBS_CC = -lmkl_lapack95_lp64
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)

git_OVERRIDE = TRUE
git_VERSION = 1.7.1

termcap_OVERRIDE = TRUE
termcap_VERSION = 5.7

readline_OVERRIDE = TRUE
readline_VERSION = 6.0


