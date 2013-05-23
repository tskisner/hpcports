
# Where to install outputs

HPCP_PREFIX = $(HOME)/hpcports

# Where to stage downloaded package source

HPCP_POOL = $(HOME)/hpcports_pool

# Optional Environment version- if you are installing with multiple
# toolchain versions.
#HPCP_ENV = 1.0

# Optional module file suffix- to avoid name collisions on systems
# which already have modules installed.
#HPCP_MOD_SUFFIX = -hpcp

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# set to FALSE to disable shared libraries
#BUILD_DYNAMIC = FALSE

# Various tools.  the defaults are below, and you
# can uncomment and change them if necessary.
#
#SHELL = /bin/bash
#MAKE = make -s
#WGET = wget
#MD5 = md5sum
#PATCH = patch
#GIT = git

# permissions on installed files. these permissions will
# be applied to both the POOL directory and the install prefix.

MY_DEFAULT_GROUP := $(shell groups | awk {'print $1'})
INST_GRP = $(MY_DEFAULT_GROUP)
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran

# Linking.  These are passed to all linking operations, and can
# be used as a catch-all to link to special system libraries.

LDFLAGS = 
LIBS = 

# vendor math libraries.  supported are apple, intel, and amd:

#VENDOR = apple
#APPLE_CPPFLAGS =
#APPLE_LDFLAGS = -Wl,-framework,Accelerate
#APPLE_LIBS_CC =
#APPLE_LIBS_CXX =
#APPLE_LIBS_F77 =
#APPLE_LIBS_FC =

#VENDOR = intel
#INTEL_CPPFLAGS = -I$(MKL_INC)
#INTEL_LDFLAGS = -L$(MKL_HOME)/lib/em64t
#INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
#INTEL_LIBS_CXX = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
#INTEL_LIBS_F77 = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
#INTEL_LIBS_FC = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread

#VENDOR = amd
#AMD_CPPFLAGS = -I$(ACML_DIR)/gfortran64_mp/include
#AMD_LDFLAGS = -L$(ACML_DIR)/gfortran64_mp/lib
#AMD_LIBS_CC = -lacml_mp -lacml_mv
#AMD_LIBS_CXX = -lacml_mp -lacml_mv
#AMD_LIBS_F77 = -lacml_mp -lacml_mv
#AMD_LIBS_FC = -lacml_mp -lacml_mv

# package overrides


