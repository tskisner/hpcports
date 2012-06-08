
ifndef PREFIX
  PREFIX := /data/software/hpcports
endif

# software download location

POOL = /data/software/src

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

CFLAGS = "-O0 -g"
CXXFLAGS = "-O0 -g"
FFLAGS = "-O0 -g"
FCFLAGS = "-O0 -g"

# example override
#boost_OVERRIDE = TRUE
#boost_CPPFLAGS = -I/ports/include
#boost_LDFLAGS = -L/ports/lib

