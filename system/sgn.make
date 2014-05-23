
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/sgn/hpcports

# OS environment version
#
# For sgn, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-tsk/4.8.2_rh5
# 2.0 : gnu-base/gcc490_bin224
#

HPCP_ENV = 2.0

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

# compile flags

CFLAGS = -O3 -g -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -g -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -g -fPIC -DNDEBUG
FCFLAGS = -O3 -g -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# general linking

LIBS = -lm -lpthread

# vendor math libraries

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.4.13

tk_OVERRIDE = TRUE
tk_VERSION = 8.4.13

git_OVERRIDE = TRUE
git_VERSION = 1.7.7.4

