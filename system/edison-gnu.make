
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
#export HPCP_PREFIX=/project/projectdirs/cmb/modules/edison/hpcports_gnu

# OS environment version
#
# For edison, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.2, cray-mpich2 5.6.1, cray-libsci 12.0.00, fftw 3.3.0.1, python 2.7.3
# 2.0 :  same as 1.0, but new module versioning scheme
#

HPCP_ENV = 2.0

# suffix, to avoid name collisions with nersc modules

MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
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
FFLAGS = -O3 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing
FLIBS = /opt/gcc/4.7.2/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.7.2/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS =
LDFLAGS =

# vendor math libraries (MKL not supported with gnu toolchain)

VENDOR = 

# package overrides

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSON = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

gitgit_OVERRIDE = TRUE
gitgit_VERSION = NA

# module load zlib/1.2.7

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.7

# module load bzip2/1.0.6

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8

# module load curl/7.28.1

curl_OVERRIDE = TRUE
curl_VERSION = 7.28.1

# module load python/2.7.3

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.3

fftw_OVERRIDE = TRUE
fftw_VERSION = $(FFTW_VERSION)
fftw_PREFIX = /opt/fftw/$(FFTW_VERSION)

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.10.2

nose_OVERRIDE = TRUE
nose_VERSION = 1.1.2

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.6.2

scipy_OVERRIDE = TRUE
scipy_VERSION = 0.11.0

pyfits_OVERRIDE = TRUE
pyfits_VERSION = NA

# module load ipython/0.13.1

ipython_OVERRIDE = TRUE
ipython_VERSION = 0.13.1

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.1.0

# module load mpi4py/1.3

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = 1.3

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
blas_LIBS_CC = $(CRAY_LIBSCI_PREFIX_DIR)lib/libsci_gnu_mp.a /opt/gcc/4.7.2/snos/lib64/libgfortran.a /opt/gcc/4.7.2/snos/lib64/libgomp.a
blas_LIBS_CXX = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.7.2/snos/lib64/libgfortran.a /opt/gcc/4.7.2/snos/lib64/libgomp.a
blas_LIBS_FC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.7.2/snos/lib64/libgfortran.a /opt/gcc/4.7.2/snos/lib64/libgomp.a
blas_LIBS_F77 = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.7.2/snos/lib64/libgfortran.a /opt/gcc/4.7.2/snos/lib64/libgomp.a

lapack_OVERRIDE = TRUE
lapack_VERSION = 12.0.00

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 12.0.00

