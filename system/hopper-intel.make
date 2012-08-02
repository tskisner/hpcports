
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_intel

# OS environment version
#
# For hopper, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  intel 12.1.4.319, mkl 12.1.2.27, xt-mpich2 5.4.5, python 2.7.1
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

MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn

# compile flags

CFLAGS = -O3 -no-prec-div -xHost -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -no-prec-div -xHost -static -fPIC -DNDEBUG
FFLAGS = -O3 -no-prec-div -xHost -static -fPIC -DNDEBUG -save-temps
FCFLAGS = -O3 -no-prec-div -xHost -static -fPIC -DNDEBUG -save-temps

# OpenMP flags

OMPFLAGS = -openmp

# Fortran mixing

FLIBS = -lifcore -limf
FCLIBS = -lifcore -limf
MPIFCLIBS =

# Linking

LIBS =
LDFLAGS =

# vendor math libraries

VENDOR = intel
INTEL_CPPFLAGS = -I$(MKL_INC)
INTEL_LDFLAGS =
INTEL_LIBS_CC = $(MKL)
INTEL_LIBS_CXX = $(MKL)
INTEL_LIBS_F77 = $(MKL)
INTEL_LIBS_FC = $(MKL)


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

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.0

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.1

fftw_OVERRIDE = TRUE
fftw_VERSION = 12.1.2.273
fftw_CPPFLAGS = $(INTEL_CPPFLAGS)
fftw_LDFLAGS = $(INTEL_LDFLAGS)
fftw_LIBS_CC = $(INTEL_LIBS_CC)
fftw_LIBS_CXX = $(INTEL_LIBS_CXX)
fftw_LIBS_F77 = $(INTEL_LIBS_F77)
fftw_LIBS_FC = $(INTEL_LIBS_FC)

nose_OVERRIDE = TRUE
nose_VERSION = 2.7.1

numpy_OVERRIDE = TRUE
numpy_VERSION = 2.7.1

scipy_OVERRIDE = TRUE
scipy_VERSION = 2.7.1

pyfits_OVERRIDE = TRUE
pyfits_VERSION = 2.7.1

ipython_OVERRIDE = TRUE
ipython_VERSION = 2.7.1

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 2.7.1

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = 2.7.1

pyslalib_OVERRIDE = TRUE
pyslalib_VERSION = 2.7.1

scientific_OVERRIDE = TRUE
scientific_VERSION = 2.7.1

healpy_OVERRIDE = TRUE
healpy_VERSION = 2.7.1

numexpr_OVERRIDE = TRUE
numexpr_VERSION = 2.7.1

# we get BLAS from ACML and Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 4.4.0
blas_CPPFLAGS = $(AMD_CPPFLAGS)
blas_LDFLAGS = $(AMD_LDFLAGS)
blas_LIBS_CC = $(AMD_LIBS_CC)
blas_LIBS_CXX = $(AMD_LIBS_CXX)
blas_LIBS_FC = $(AMD_LIBS_FC)
blas_LIBS_F77 = $(AMD_LIBS_F77)

lapack_OVERRIDE = TRUE
lapack_VERSION = 11.0.06

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 11.0.06

