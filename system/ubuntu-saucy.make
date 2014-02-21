# This assumes that macports is used, and that you have installed the ports
# listed in the osx.macports.sh file (i.e. run "sudo bash osx.macports.sh").

# software install location (set this in your ~/.bashrc or similar)
#HPCP_PREFIX = $(HOME)/hpcports

# OS environment version (set to osx version plus macports version)

HPCP_ENV = 13.10

# software download location (set this in your ~/.bashrc or similar)
#HPCP_POOL = $(HOME)/hpcports_pool

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# permissions on installed files

INST_GRP = users
INST_PERM = a+rX

# serial compilers.  we also explicitly disable fortran

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

root = /usr

astropy_OVERRIDE = TRUE
astropy_VERSION = 0.2.3
astropy_PREFIX = $(root)

autoconf_OVERRIDE = TRUE
autoconf_VERSION = 2.69
autoconf_PREFIX = $(root)

automake_OVERRIDE = TRUE
automake_VERSION = 1.13.3
automake_PREFIX = $(root)

blas_OVERRIDE = TRUE
blas_VERSION = 0.2.8
blas_PREFIX = $(root)
blas_LIBS_CC = -lblas
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)

boost_OVERRIDE = TRUE
boost_VERSION = 1.54
boost_PREFIX = $(root)

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6
bzip2_PREFIX = $(root)

cfitsio_OVERRIDE = TRUE
cfitsio_VERSION = 3.310
cfitsio_PREFIX = $(root)

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.11
cmake_PREFIX = $(root)

curl_OVERRIDE = TRUE
curl_VERSION = 7.32.0
curl_PREFIX = $(root)

cython_OVERRIDE = TRUE
cython_VERSION = 0.19
cython_PREFIX = $(root)

eigen_OVERRIDE = TRUE
eigen_VERSION = 3.2.0
eigen_PREFIX = $(root)

expat_OVERRIDE = TRUE
expat_VERSION = 2.1.0
expat_PREFIX = $(root)

fftw_OVERRIDE = TRUE
fftw_VERSION = 3.3.3
fftw_PREFIX = $(root)

gdb_OVERRIDE = TRUE
gdb_VERSION = 7.6.1
gdb_PREFIX = $(root)

git_OVERRIDE = TRUE
git_VERSION = 1.8.3.2
git_PREFIX = $(root)

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.18.1.1
gettext_PREFIX = $(root)

gsl_OVERRIDE = TRUE
gsl_VERSION = 1.16
gsl_PREFIX = $(root)

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.6
gzip_PREFIX = $(root)

h5py_OVERRIDE = TRUE
h5py_VERSION = 2.0.1
h5py_PREFIX = $(root)

hdf5_OVERRIDE = TRUE
hdf5_VERSION = 1.8.11
hdf5_PREFIX = $(root)

hdf5_mpi_OVERRIDE = TRUE
hdf5_mpi_VERSION = 1.8.11
hdf5_mpi_PREFIX = $(root)

ipython_OVERRIDE = TRUE
ipython_VERSION = 0.13.2
ipython_PREFIX = $(root)

lapack_OVERRIDE = TRUE
lapack_VERSION = 3.4.2
lapack_PREFIX = $(root)
lapack_LIBS_CC = -llapack
lapack_LIBS_CXX = $(lapack_LIBS_CC)
lapack_LIBS_F77 = $(lapack_LIBS_CC)
lapack_LIBS_FC = $(lapack_LIBS_CC)

libarchive_OVERRIDE = TRUE
libarchive_VERSION = 3.1.2
libarchive_PREFIX = $(root)

libjpeg_OVERRIDE = TRUE
libjpeg_VERSION = 8c
libjpeg_PREFIX = $(root)

libtiff_OVERRIDE = TRUE
libtiff_VERSION = 4.0.2
libtiff_PREFIX = $(root)

libtool_OVERRIDE = TRUE
libtool_VERSION = 2.4.2
libtool_PREFIX = $(root)

m4_OVERRIDE = TRUE
m4_VERSION = 1.4.16
m4_PREFIX = $(root)

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.2.1
matplotlib_PREFIX = $(root)

mpi4py_OVERRIDE = TRUE
mpi4py_VERSION = 1.3
mpi4py_PREFIX = $(root)

mysql_client_OVERRIDE = TRUE
mysql_client_VERSION = 5.5.35
mysql_client_PREFIX = $(root)

mysql_python_OVERRIDE = TRUE
mysql_python_VERSION = 1.2.3
mysql_python_PREFIX = $(root)

netcdf_OVERRIDE = TRUE
netcdf_VERSION = 4.1.3
netcdf_PREFIX = $(root)

nose_OVERRIDE = TRUE
nose_VERSION = 1.3.0
nose_PREFIX = $(root)

numexpr_OVERRIDE = TRUE
numexpr_VERSION = 2.0.1
numexpr_PREFIX = $(root)

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.7.1
numpy_PREFIX = $(root)

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.4.5
openmpi_PREFIX = $(root)

openssl_OVERRIDE = TRUE
openssl_VERSION = 1.0.1e
openssl_PREFIX = $(root)

pcre_OVERRIDE = TRUE
pcre_VERSION = 8.31
pcre_PREFIX = $(root)

plplot_OVERRIDE = TRUE
plplot_VERSION = 5.9.9
plplot_PREFIX = $(root)

postgresql_OVERRIDE = TRUE
postgresql_VERSION = 9.3
postgresql_PREFIX = $(root)

psycopg2_OVERRIDE = TRUE
psycopg2_VERSION = 2.4.5
psycopg2_PREFIX = $(root)

pyfits_OVERRIDE = TRUE
pyfits_VERSION = 3.1.2
pyfits_PREFIX = $(root)

python_OVERRIDE = TRUE
python_VERSION = 2.7.5
python_PREFIX = $(root)

readline_OVERRIDE = TRUE
readline_VERSION = 6.2
readline_PREFIX = $(root)

scientific_OVERRIDE = TRUE
scientific_VERSION = 2.9.2
scientific_PREFIX = $(root)

scipy_OVERRIDE = TRUE
scipy_VERSION = 0.12.0
scipy_PREFIX = $(root)

scons_OVERRIDE = TRUE
scons_VERSION = 2.3.0
scons_PREFIX = $(root)

screen_OVERRIDE = TRUE
screen_VERSION = 4.0.3
screen_PREFIX = $(root)

setuptools_OVERRIDE = TRUE
setuptools_VERSION = 0.6.37
setuptools_PREFIX = $(root)

sfftw_OVERRIDE = TRUE
sfftw_VERSION = 2.1.5
sfftw_PREFIX = $(root)

sqlite_OVERRIDE = TRUE
sqlite_VERSION = 2.8.17
sqlite_PREFIX = $(root)

swig_OVERRIDE = TRUE
swig_VERSION = 2.0.10
swig_PREFIX = $(root)

tcsh_OVERRIDE = TRUE
tcsh_VERSION = 6.18.01
tcsh_PREFIX = $(root)

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.6
tcl_PREFIX = $(root)

tk_OVERRIDE = TRUE
tk_VERSION = 8.6
tk_PREFIX = $(root)

termcap_OVERRIDE = TRUE
termcap_VERSION = 6.2
termcap_PREFIX = $(root)

urwid_OVERRIDE = TRUE
urwid_VERSION = 1.1.1
urwid_PREFIX = $(root)

valgrind_OVERRIDE = TRUE
valgrind_VERSION = 3.8.1
valgrind_PREFIX = $(root)

wcslib_OVERRIDE = TRUE
wcslib_VERSION = 4.18
wcslib_PREFIX = $(root)

wcstools_OVERRIDE = TRUE
wcstools_VERSION = 3.8.7
wcstools_PREFIX = $(root)

xpa_OVERRIDE = TRUE
xpa_VERSION = 2.1.15
xpa_PREFIX = $(root)

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.8
zlib_PREFIX = $(root)


