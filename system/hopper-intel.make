
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_gnu

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 : intel-13.0.1.117, MKL-12.1.2.273, xt-mpich2 5.6.0, fftw 3.3.0.1, python 2.7.3
#

HPCP_ENV = 1.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = intel
BUILD_DYNAMIC = FALSE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = cmb
INST_PERM = g+rwX,o+rX

# serial compilers

CC = cc
CXX = CC
F77 = ftn
FC = ftn

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = cray.mpich2
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn

# compile flags

CFLAGS = -O3 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -static -fPIC -DNDEBUG
FFLAGS = -O3 -static -fPIC -DNDEBUG -fexceptions
FCFLAGS = -O3 -static -fPIC -DNDEBUG -fexceptions

# OpenMP flags

OMPFLAGS = -openmp

# Fortran mixing

FLIBS = -lifcoremt
FCLIBS = -lifcoremt
MPIFCLIBS =

# Linking

LIBS =
LDFLAGS =

# vendor math libraries

VENDOR = intel
INTEL_INCLUDE = $(MKL_INC)
INTEL_LIBDIR = $(MKL_LIBDIR)
INTEL_LIBS_CC = -Wl,--start-group $(MKL_HOME)/lib/intel64/libmkl_intel_lp64.a $(MKL_HOME)/lib/intel64/libmkl_intel_thread.a $(MKL_HOME)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
INTEL_LIBS_CXX = -Wl,--start-group $(MKL_HOME)/lib/intel64/libmkl_intel_lp64.a $(MKL_HOME)/lib/intel64/libmkl_intel_thread.a $(MKL_HOME)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
INTEL_LIBS_F77 = -Wl,--start-group $(MKL_HOME)/lib/intel64/libmkl_intel_lp64.a $(MKL_HOME)/lib/intel64/libmkl_intel_thread.a $(MKL_HOME)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
INTEL_LIBS_FC = -Wl,--start-group $(MKL_HOME)/lib/intel64/libmkl_intel_lp64.a $(MKL_HOME)/lib/intel64/libmkl_intel_thread.a $(MKL_HOME)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm

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

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.1

fftw_OVERRIDE = TRUE
fftw_VERSION = 3.3.0.1

nose_OVERRIDE = TRUE
nose_VERSION = NA

astropy_OVERRIDE = TRUE
astropy_VERSION = NA

pyraf_OVERRIDE = TRUE
pyraf_VERSION = NA

numpy_OVERRIDE = TRUE
numpy_VERSION = NA

scipy_OVERRIDE = TRUE
scipy_VERSION = NA

pyfits_OVERRIDE = TRUE
pyfits_VERSION = NA

ipython_OVERRIDE = TRUE
ipython_VERSION = NA

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = NA

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = NA

pyslalib_OVERRIDE = TRUE
pyslalib_VERSION = NA

scientific_OVERRIDE = TRUE
scientific_VERSION = NA

healpy_OVERRIDE = TRUE
healpy_VERSION = NA

numexpr_OVERRIDE = TRUE
numexpr_VERSION = NA

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 12.0.00
blas_LIBS_CC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_intel_mp.a
blas_LIBS_CXX = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_intel_mp.a
blas_LIBS_FC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_intel_mp.a
blas_LIBS_F77 = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_intel_mp.a

lapack_OVERRIDE = TRUE
lapack_VERSION = 12.0.00

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 12.0.00

