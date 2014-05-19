
# software install location (set this in your ~/.bashrc or similar)
#HPCP_PREFIX = $(HOME)/hpcports

# OS environment version (set to osx version plus macports version)

HPCP_ENV = 1.0

# software download location (set this in your ~/.bashrc or similar)
#HPCP_POOL = $(HOME)/hpcports_pool

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# permissions on installed files

INST_GRP = adm
INST_PERM = a+rX

# serial compilers.

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# Linking

LDFLAGS = 
LIBS = -lm

# vendor math libraries

# (None)

# package overrides

