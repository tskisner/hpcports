# This assumes that macports is used, and that the following ports are installed:
#	gcc4.8.1
#   python27
#   py27-numpy
#   py27-matplotlib
#   py27-ipython
#	gzip
#


ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = gcc481

# software download location

HPCP_POOL = /data/software/hpcports_pool

# UNIX tools

MD5 = md5
MAKE = make

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = darwin
BUILD_DYNAMIC = FALSE

# permissions on installed files

INST_GRP = staff
INST_PERM = a+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# compile flags

CFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG
CXXFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG
FFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG
FCFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# Linking

LDFLAGS = 

# vendor math libraries

VENDOR = apple
APPLE_INCLUDE =
APPLE_LIBDIR = 
APPLE_LIBS_CC = -Wl,-framework,Accelerate 
APPLE_LIBS_CXX = -Wl,-framework,Accelerate
APPLE_LIBS_F77 = -Wl,-framework,Accelerate
APPLE_LIBS_FC = -Wl,-framework,Accelerate

# package overrides

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.12.4-apple

blas_OVERRIDE = TRUE
blas_VERSION = 10.8-apple
blas_LIBS_CC = -Wl,-framework,vecLib
blas_LIBS_CXX = -Wl,-framework,vecLib
blas_LIBS_F77 = -Wl,-framework,vecLib
blas_LIBS_FC = -Wl,-framework,vecLib

# override broken matplotlib

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = NA



