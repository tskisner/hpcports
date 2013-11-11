# This assumes that macports is used, and that you have installed the ports
# listed in the osx.macports.sh file (i.e. run "sudo bash osx.macports.sh").

# software install location (set this in your ~/.bashrc or similar)
#HPCP_PREFIX = $(HOME)/hpcports

# OS environment version (set to osx version plus macports version)

HPCP_ENV = 10.8-2.2.1

# software download location (set this in your ~/.bashrc or similar)
#HPCP_POOL = $(HOME)/hpcports_pool

# UNIX tools

MD5 = md5
MAKE = make

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = darwin

# permissions on installed files

INST_GRP = staff
INST_PERM = a+rX

# serial compilers.  we also explicitly disable fortran

CC = gcc
CXX = g++
F77 = 
FC = 

BUILD_FORTRAN = FALSE

# compile flags

CFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG
CXXFLAGS = -O2 -m64 -g -fno-common -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Linking

LDFLAGS = 

# vendor math libraries

VENDOR = apple
APPLE_INCLUDE =
APPLE_LIBDIR = 
APPLE_LIBS_CC = -Wl,-framework,Accelerate 
APPLE_LIBS_CXX = -Wl,-framework,Accelerate
APPLE_LIBS_F77 = -Wl,-framework,Accelerate
APPLE_LIBS_FC = -Wl,-framework,Accelerate

# package overrides

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.12.4-apple

blas_OVERRIDE = TRUE
blas_VERSION = 10.8-apple
blas_LIBS_CC = -Wl,-framework,vecLib
blas_LIBS_CXX = -Wl,-framework,vecLib
blas_LIBS_F77 = -Wl,-framework,vecLib
blas_LIBS_FC = -Wl,-framework,vecLib

lapack_OVERRIDE = TRUE
lapack_VERSION = 10.8-apple


# override packages provided by macports

autoconf_OVERRIDE = TRUE
autoconf_VERSION = 2.69

automake_OVERRIDE = TRUE
automake_VERSION = 1.14

boost_OVERRIDE = TRUE
boost_VERSION = 1.54.0

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6

cfitsio_OVERRIDE = TRUE
cfitsio_VERSION = 3.340

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.12

curl_OVERRIDE = TRUE
curl_VERSION = 7.33.0

eigen_OVERRIDE = TRUE
eigen_VERSION = 3.2.0

expat_OVERRIDE = TRUE
expat_VERSION = 2.1.0

fftw_OVERRIDE = TRUE
fftw_VERSION = 3.3.3

gdb_OVERRIDE = TRUE
gdb_VERSION = 6.3.50

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.18.3.1

gsl_OVERRIDE = TRUE
gsl_VERSION = 1.16_1

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.6

h5py_OVERRIDE = TRUE
h5py_VERSION = 2.2.0

hdf5_OVERRIDE = TRUE
hdf5_VERSION = 1.8.11

ipython_OVERRIDE = TRUE
ipython_VERSION = 1.1.0

libarchive_OVERRIDE = TRUE
libarchive_VERSION = 3.1.2

libjpeg_OVERRIDE = TRUE
libjpeg_VERSION = 1.2.1

libtool_OVERRIDE = TRUE
libtool_VERSION = 2.4.2

m4_OVERRIDE = TRUE
m4_VERSION = 1.4.16

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.3.0

mysql_client_OVERRIDE = TRUE
mysql_client_VERSION = 1.2.3

mysql_python_OVERRIDE = TRUE
mysql_python_VERSION = 1.2.3

netcdf_OVERRIDE = TRUE
netcdf_VERSION = 4.3.0

nose_OVERRIDE = TRUE
nose_VERSION = 1.3.0

numexpr_OVERRIDE = TRUE
numexpr_VERSION = 2.2.2

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.7.1

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.7.2

openssl_OVERRIDE = TRUE
openssl_VERSION = 1.0.1e

pcre_OVERRIDE = TRUE
pcre_VERSION = 8.33

plplot_OVERRIDE = TRUE
plplot_VERSION = 5.9.9

postgresql_OVERRIDE = TRUE
postgresql_VERSION = 9.2.5

psycopg2_OVERRIDE = TRUE
psycopg2_VERSION = 2.4.6

pyfits_OVERRIDE = TRUE
pyfits_VERSION = 3.1.2

python_OVERRIDE = TRUE
python_VERSION = 2.7.5

readline_OVERRIDE = TRUE
readline_VERSION = 6.2.000

scientific_OVERRIDE = TRUE
scientific_VERSION = 2.9.2

scipy_OVERRIDE = TRUE
scipy_VERSION = 0.13.0

sqlite_OVERRIDE = TRUE
sqlite_VERSION = 3.8.0.2

swig_OVERRIDE = TRUE
swig_VERSION = 2.0.10

tcsh_OVERRIDE = TRUE
tcsh_VERSION = 6.18.01

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.6.1

tk_OVERRIDE = TRUE
tk_VERSION = 8.6.1

urwid_OVERRIDE = TRUE
urwid_VERSION = 1.1.1

valgrind_OVERRIDE = TRUE
valgrind_VERSION = 3.9.0

wcslib_OVERRIDE = TRUE
wcslib_VERSION = 4.17

wcstools_OVERRIDE = TRUE
wcstools_VERSION = 3.8.7

wget_OVERRIDE = TRUE
wget_VERSION = 1.14

xpa_OVERRIDE = TRUE
xpa_VERSION = 2.1.11

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.8





