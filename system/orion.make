
HPCP_PREFIX = /home/kisner/hpcports

HPCP_ENV = gcc463

# software download location

HPCP_POOL = /home/kisner/hpcports_pool

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

# MPI compilers

openmpi_OVERRIDE = TRUE
MPICC = mpicc
MPICXX = mpic++
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O3 -march=native -m64 -fPIC -DNDEBUG
CXXFLAGS = -O3 -march=native -m64 -fPIC -DNDEBUG
FFLAGS = -O3 -march=native -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -march=native -m64 -fPIC -DNDEBUG

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
AMD_CPPFLAGS = -I/opt/acml-4.4.0/gfortran64_mp/include
AMD_LDFLAGS = -L/opt/acml-4.4.0/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv
AMD_LIBS_CXX = -lacml_mp -lacml_mv
AMD_LIBS_F77 = -lacml_mp -lacml_mv
AMD_LIBS_FC = -lacml_mp -lacml_mv

# package overrides

blas_OVERRIDE = TRUE
blas_VERSION = 4.4.0
blas_CPPFLAGS = $(AMD_CPPFLAGS)
blas_LDFLAGS = $(AMD_LDFLAGS)
blas_LIBS_CC = $(AMD_LIBS_CC)
blas_LIBS_CXX = $(AMD_LIBS_CXX)
blas_LIBS_FC = $(AMD_LIBS_FC)
blas_LIBS_F77 = $(AMD_LIBS_F77)

