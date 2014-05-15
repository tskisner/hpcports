
HPCP_PREFIX = /proj/planck/software/hpcports_login

# OS environment version
#
# For edison, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.3, cray-mpich2 5.6.5, mkl-13.5.192
# 2.0 :  gnu 4.8.1, cray-mpich2 6.0.2, craype 1.06, mkl 13.5.192
# 3.0 :  gnu 4.8.2, cray-mpich 6.2.1, craype 2.04, libsci 12.1.3
# 4.0 :  gnu 4.8.2, craype 2.1.0, craype-network-none
#

HPCP_ENV = 4.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /proj/planck/software/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = TRUE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = pr2fg002
INST_PERM = g+rwX,o+rX

# serial compilers

CC = cc
CXX = CC
F77 = ftn
FC = ftn

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG -target-cpu=sandybridge -target-network=none
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG -std=c++11 -target-cpu=sandybridge -target-network=none
FFLAGS = -O3 -m64 -fPIC -DNDEBUG -target-cpu=sandybridge -target-network=none
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG -target-cpu=sandybridge -target-network=none

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing
FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS =

# Linking

LIBS = -lpthread -lm
LDFLAGS =
LIBTOOLFLAGS =

# vendor math libraries

VENDOR = 

# package overrides

git_OVERRIDE = TRUE
git_VERSION = 1.8.1.4

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8j

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.7

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.10.2

termcap_OVERRIDE = TRUE
termcap_VERSION = 2.0.8

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.7

# healpy is broken

healpy_OVERRIDE = TRUE
healpy_VERSION = NA

