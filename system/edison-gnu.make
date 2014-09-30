
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
# 2.0 :  gnu 4.7.2, cray-mpich 6.0.0, mkl-13.0.1, fftw-3.3.0.3, python-2.7.3
# 3.0 :  gnu 4.8.1, cray-mpich 6.0.2, mkl-13.0.1, python-2.7.3
# 4.0 :  gnu 4.8.2, craype-2.03, cray-mpich 6.2.0, cray-libsci 12.1.3, mkl-13.0.3, python-2.7.5
# 4.1 :  gnu 4.8.2, craype-2.1.1 cray-mpich 6.3.1, cray-libsci 12.2.0, mkl-13.0.3, python-2.7.5
# 4.2 :  same as 4.1, but with new HPCPorts dependency hashes.
# 5.0 :  (CDT 1.16) gnu 4.9.0, craype-2.1.2, cray-mpich 7.0.0, cray-libsci 13.0.0, mkl-13.0.3, python-2.7.5
# 6.0 :  (CDT 1.19) gnu 4.9.1, craype-2.2.0, cray-mpich 7.0.3, cray-libsci 13.0.1, mkl-13.0.3, python-2.7.5
#

HPCP_ENV = 6.0

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

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
openmpi_VERSION = cray.mpich
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn
MPILIBS = -lmpich
MPICXXLIBS = -lmpichcxx

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS =

# Linking

LIBS = -lpthread -lm
LDFLAGS =
LIBTOOLFLAGS = --preserve-dup-deps

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = /opt/intel/composer_xe_2013.5.192
INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
INTEL_LIBS_CC = $(INTEL_LIBDIR)/libmkl_gf_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a $(INTEL_LIBDIR)/libmkl_gf_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a $(INTEL_LIBDIR)/libmkl_gf_lp64.a $(INTEL_LIBDIR)/libmkl_gnu_thread.a $(INTEL_LIBDIR)/libmkl_core.a -ldl
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.5.5

tk_OVERRIDE = TRUE
tk_VERSION = 8.5.5

termcap_OVERRIDE = TRUE
termcap_VERSION = 2.0.8

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

git_OVERRIDE = TRUE
git_VERSION = 1.8.1.1

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

# module load python/2.7.5

python_OVERRIDE = TRUE
python_SITE = python2.7
python_VERSION = 2.7.5

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.11.2

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
blas_VERSION = 13.0.0
blas_LIBS_CC = 
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 13.0.0

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 13.0.0

