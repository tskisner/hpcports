
ifndef PREFIX
  PREFIX := /project/projectdirs/cmb/modules/carver/hpcports_gnu
endif

# software download location

POOL = /project/projectdirs/cmb/modules/carver/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# UNIX tools

SHELL = /bin/bash
MAKE = make -s
PYTHON = python

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

CFLAGS = -O3 -march=native
CXXFLAGS = -O3 -march=native
FFLAGS = -O3 -march=native
FCFLAGS = -O3 -march=native

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



