
HPCP_PREFIX = /planck/tools/hpcports

# OS environment version
#
# For carver, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-4.8.2, MKL 10.0.3
# 1.1 : gcc-4.8.2
#

HPCP_ENV = 1.1

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /planck/tools/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = planck
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# MPI options

openmpi_EXTRA = \
	--with-udapl \
      	--with-tm \
      	--with-openib \
  	--disable-dlopen \
	--without-slurm \
	--without-loadleveler \
	--without-mx \
	--without-lsf

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# general linking

LIBS = -lpthread -lm

# vendor math libraries

VENDOR =

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.4.13

tk_OVERRIDE = TRUE
tk_VERSION = 8.4.13

