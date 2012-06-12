
ifndef PREFIX
  PREFIX := /data/software/hpcports
endif

# software download location

POOL = /data/software/src

# toolchain (gnu, intel, ibm)

TOOLCHAIN = gnu

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

# vendor math libraries

VENDOR = apple
APPLE_CPPFLAGS = 
APPLE_LDFLAGS = -Wl,-framework,Accelerate
APPLE_LIBS_CC = 
APPLE_LIBS_CXX = 
APPLE_LIBS_F77 = 
APPLE_LIBS_FC = 

# package overrides

#boost_OVERRIDE = TRUE
#boost_PREFIX = /ports


