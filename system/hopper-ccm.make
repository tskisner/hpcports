
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_ccm

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : gcc-4.7.2, ACML 5.1.0, OpenMPI 1.6.3
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = TRUE

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
openmpi_VERSION = 1.6.3
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O3 -g -march=native -m64 -shared -dynamic -fPIC -DNDEBUG
CXXFLAGS = -O3 -g -march=native -m64 -shared -dynamic -fPIC -DNDEBUG
FFLAGS = -O3 -g -march=native -m64 -shared -dynamic -fPIC -DNDEBUG
FCFLAGS = -O3 -g -march=native -m64 -shared -dynamic -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran.a
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LIBS =
LDFLAGS =

# vendor math libraries

VENDOR = cray

# package overrides

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSON = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.4

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.3

tcsh_OVERRIDE = TRUE
tcsh_VERSION = 6.15

#tcl_OVERRIDE = TRUE
#tcl_VERSION = 8.5.5

#tk_OVERRIDE = TRUE
#tk_VERSION = 8.5.5

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.0

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 12.0.00
blas_INCLUDE = $(CRAY_LIBSCI_PREFIX_DIR)/include
blas_LIBDIR = $(CRAY_LIBSCI_PREFIX_DIR)/lib
blas_LIBS_CC = -lsci_gnu_mp.a
blas_LIBS_CXX = -lsci_gnu_mp.a
blas_LIBS_FC = -lsci_gnu_mp.a
blas_LIBS_F77 = -lsci_gnu_mp.a

lapack_OVERRIDE = TRUE
lapack_VERSION = 12.0.00

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 12.0.00
