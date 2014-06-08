
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
# 1.0 : gcc-4.6.3, ACML 4.4.0, xt-mpich2 5.4.5, fftw 3.3.0.0, python 2.7.1
# 2.0 : gcc-4.7.1, ACML 4.4.0, cray-mpich2 5.5.2, fftw 3.3.0.0, python 2.7.1
# 3.0 : gcc-4.7.2, ACML 4.4.0, cray-mpich2 5.5.5, fftw 3.3.0.1, python 2.7.3
# 4.0 : gcc-4.7.2, ACML 4.4.0, xt-asyncpe 5.19, cray-mpich2 5.6.4, fftw 3.3.0.2, python 2.7.3
# 5.0 : gcc-4.7.2, ACML 4.4.0, xt-asyncpe 5.23, cray-mpich2 5.6.4, fftw 3.3.0.2, python 2.7.3, darshan 2.2.6
# 6.0 : gcc-4.8.1, ACML 4.4.0, xt-asyncpe 5.23, cray-mpich 6.1.0, fftw 3.3.0.4, python 2.7.5
# 6.1 : same as 6.0, but with new HPCP dependency version hash
#

HPCP_ENV = 6.1

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

CFLAGS = -O3 -m64 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -m64 -static -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -m64 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = /opt/gcc/4.8.1/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.8.1/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = /opt/gcc/4.8.1/snos/lib64/libgomp.a /usr/lib64/librt.a
LDFLAGS = -L/usr/common/usg/acml/4.4.0/gfortran64_mp/lib

# vendor math libraries

VENDOR = amd
AMD_PREFIX = $(ACML_DIR)
AMD_INCLUDE = $(ACML_DIR)/gfortran64_mp/include
AMD_LIBDIR = $(ACML_DIR)/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_CXX = -lacml_mp -lacml_mv /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_F77 = -lacml_mp -lacml_mv /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_FC = -lacml_mp -lacml_mv /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a /usr/lib64/librt.a

# package overrides

termcap_OVERRIDE = TRUE
termcap_VERSION = 2.0.8

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

git_OVERRIDE = TRUE
git_VERSION = 1.7.7.4

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
python_VERSION = 2.7.5

fftw_OVERRIDE = TRUE
fftw_VERSION = 3.3.0.4

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
blas_VERSION = 12.1.01
blas_LIBS_CC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a
blas_LIBS_CXX = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a
blas_LIBS_FC = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a
blas_LIBS_F77 = $(CRAY_LIBSCI_PREFIX_DIR)/lib/libsci_gnu_mp.a /opt/gcc/4.8.1/snos/lib64/libgfortran.a /opt/gcc/4.8.1/snos/lib64/libgomp.a

lapack_OVERRIDE = TRUE
lapack_VERSION = 12.1.01

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 12.1.01

