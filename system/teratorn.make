
ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = gcc447

# software download location

HPCP_POOL = /data/software/hpcports_pool

# UNIX tools

MD5 = md5
MAKE = make
PYTHON = python

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = darwin

# permissions on installed files

INST_GRP = staff
INST_PERM = a+rX

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

CFLAGS = -O0 -g
CXXFLAGS = -O0 -g
FFLAGS = -O0 -g
FCFLAGS = -O0 -g

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran -lgfortranbegin
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# vendor math libraries

VENDOR = apple
APPLE_CPPFLAGS =
APPLE_LDFLAGS = -Wl,-framework,Accelerate
APPLE_LIBS_CC =
APPLE_LIBS_CXX =
APPLE_LIBS_F77 =
APPLE_LIBS_FC =

# package overrides

boost_OVERRIDE = TRUE
boost_PREFIX = /ports
boost_VERSION = 1.49-macports
boost_CPPFLAGS = -I/ports/include
boost_LDFLAGS = -L/ports/lib

