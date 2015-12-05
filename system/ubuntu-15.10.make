# This assumes that you have installed all the packages by running the
# ubuntu-15.04-setup.pl script

# software install location (set this in your ~/.bashrc or similar)
# HPCP_PREFIX = $(HOME)/hpcports

# OS environment version

HPCP_ENV = 15.10

# software download location (set this in your ~/.bashrc or similar)
# HPCP_POOL = $(HOME)/hpcports_pool

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

# MPI compilers

MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LDFLAGS = 
LIBS = -lm

# vendor math libraries

# (None)

# package overrides

blas_LIBS_CC = -lblas
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)

lapack_LIBS_CC = -llapack
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)

termcap_OVERRIDE = TRUE
termcap_VERSION = sys

root = /usr


m4_OVERRIDE = TRUE
m4_PREFIX = $(root)
m4_VERSION = 1.4.17

postgresql_OVERRIDE = TRUE
postgresql_PREFIX = $(root)
postgresql_VERSION = 9.4

cython_OVERRIDE = TRUE
cython_PREFIX = $(root)
cython_VERSION = 0.23.3

tcsh_OVERRIDE = TRUE
tcsh_PREFIX = $(root)
tcsh_VERSION = 6.18.01

bzip2_OVERRIDE = TRUE
bzip2_PREFIX = $(root)
bzip2_VERSION = 1.0.6

plplot_OVERRIDE = TRUE
plplot_PREFIX = $(root)
plplot_VERSION = 5.10.0

automake_OVERRIDE = TRUE
automake_PREFIX = $(root)
automake_VERSION = 1.15

scipy_OVERRIDE = TRUE
scipy_PREFIX = $(root)
scipy_VERSION = 0.14.1

tcl_OVERRIDE = TRUE
tcl_PREFIX = $(root)
tcl_VERSION = 8.6.4

hdf5_OVERRIDE = TRUE
hdf5_PREFIX = $(root)
hdf5_VERSION = 1.8.15

ipython_OVERRIDE = TRUE
ipython_PREFIX = $(root)
ipython_VERSION = 2.3.0

readline_OVERRIDE = TRUE
readline_PREFIX = $(root)
readline_VERSION = 6.3

h5py_OVERRIDE = TRUE
h5py_PREFIX = $(root)
h5py_VERSION = 2.5.0

sqlite_OVERRIDE = TRUE
sqlite_PREFIX = $(root)
sqlite_VERSION = 3.8.11.1

cfitsio_OVERRIDE = TRUE
cfitsio_PREFIX = $(root)
cfitsio_VERSION = 3.370

urwid_OVERRIDE = TRUE
urwid_PREFIX = $(root)
urwid_VERSION = 1.2.1

matplotlib_OVERRIDE = TRUE
matplotlib_PREFIX = $(root)
matplotlib_VERSION = 1.4.2

blas_OVERRIDE = TRUE
blas_PREFIX = $(root)
blas_VERSION = 0.2.14

gsl_OVERRIDE = TRUE
gsl_PREFIX = $(root)
gsl_VERSION = 1.16

curl_OVERRIDE = TRUE
curl_PREFIX = $(root)
curl_VERSION = 7.43.0

zlib_OVERRIDE = TRUE
zlib_PREFIX = $(root)
zlib_VERSION = 1.2.8.dfsg

screen_OVERRIDE = TRUE
screen_PREFIX = $(root)
screen_VERSION = 4.3.1

netcdf_OVERRIDE = TRUE
netcdf_PREFIX = $(root)
netcdf_VERSION = 4.4.0~rc2

expat_OVERRIDE = TRUE
expat_PREFIX = $(root)
expat_VERSION = 2.1.0

git_OVERRIDE = TRUE
git_PREFIX = $(root)
git_VERSION = 2.5.0

autoconf_OVERRIDE = TRUE
autoconf_PREFIX = $(root)
autoconf_VERSION = 2.69

libtiff_OVERRIDE = TRUE
libtiff_PREFIX = $(root)
libtiff_VERSION = 4.0.3

python_OVERRIDE = TRUE
python_PREFIX = $(root)
python_VERSION = 2.7.9

swig_OVERRIDE = TRUE
swig_PREFIX = $(root)
swig_VERSION = 2.0.12

numpy_OVERRIDE = TRUE
numpy_PREFIX = $(root)
numpy_VERSION = 1.8.2

libarchive_OVERRIDE = TRUE
libarchive_PREFIX = $(root)
libarchive_VERSION = 3.1.2

wcstools_OVERRIDE = TRUE
wcstools_PREFIX = $(root)
wcstools_VERSION = 3.9.2

cmake_OVERRIDE = TRUE
cmake_PREFIX = $(root)
cmake_VERSION = 3.2.2

libtool_OVERRIDE = TRUE
libtool_PREFIX = $(root)
libtool_VERSION = 2.4.2

astropy_OVERRIDE = TRUE
astropy_PREFIX = $(root)
astropy_VERSION = 1.0.3

numexpr_OVERRIDE = TRUE
numexpr_PREFIX = $(root)
numexpr_VERSION = 2.4.3

gzip_OVERRIDE = TRUE
gzip_PREFIX = $(root)
gzip_VERSION = 1.6

pcre_OVERRIDE = TRUE
pcre_PREFIX = $(root)
pcre_VERSION = 8.35

mysql_python_OVERRIDE = TRUE
mysql_python_PREFIX = $(root)
mysql_python_VERSION = 1.3.4

tk_OVERRIDE = TRUE
tk_PREFIX = $(root)
tk_VERSION = 8.6.4

valgrind_OVERRIDE = TRUE
valgrind_PREFIX = $(root)
valgrind_VERSION = 3.11.0

fftw_OVERRIDE = TRUE
fftw_PREFIX = $(root)
fftw_VERSION = 3.3.4

libxml2_OVERRIDE = TRUE
libxml2_PREFIX = $(root)
libxml2_VERSION = 2.9.2

setuptools_OVERRIDE = TRUE
setuptools_PREFIX = $(root)
setuptools_VERSION = 18.4

gdb_OVERRIDE = TRUE
gdb_PREFIX = $(root)
gdb_VERSION = 7.10

boost_OVERRIDE = TRUE
boost_PREFIX = $(root)
boost_VERSION = 1.58.0

wcslib_OVERRIDE = TRUE
wcslib_PREFIX = $(root)
wcslib_VERSION = 4.24

eigen_OVERRIDE = TRUE
eigen_PREFIX = $(root)
eigen_VERSION = 3.2.5

sfftw_OVERRIDE = TRUE
sfftw_PREFIX = $(root)
sfftw_VERSION = 2.1.5

lapack_OVERRIDE = TRUE
lapack_PREFIX = $(root)
lapack_VERSION = 3.5.0

openmpi_OVERRIDE = TRUE
openmpi_PREFIX = $(root)
openmpi_VERSION = 1.6.5

nose_OVERRIDE = TRUE
nose_PREFIX = $(root)
nose_VERSION = 1.3.6

psycopg2_OVERRIDE = TRUE
psycopg2_PREFIX = $(root)
psycopg2_VERSION = 2.6.1

scons_OVERRIDE = TRUE
scons_PREFIX = $(root)
scons_VERSION = 2.3.6

scientific_OVERRIDE = TRUE
scientific_PREFIX = $(root)
scientific_VERSION = 2.9.4

mysql_client_OVERRIDE = TRUE
mysql_client_PREFIX = $(root)
mysql_client_VERSION = 5.6.27

mpi4py_OVERRIDE = TRUE
mpi4py_PREFIX = $(root)
mpi4py_VERSION = 1.3.1

xpa_OVERRIDE = TRUE
xpa_PREFIX = $(root)
xpa_VERSION = 2.1.15

libjpeg_OVERRIDE = TRUE
libjpeg_PREFIX = $(root)
libjpeg_VERSION = 8c

