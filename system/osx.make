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

CC = clang
CXX = clang++
F77 = 
FC = 

BUILD_FORTRAN = FALSE

# compile flags

CFLAGS = -O3 -fno-common -fPIC -DNDEBUG
CXXFLAGS = -O3 -fno-common -fPIC -DNDEBUG -std=c++11 -stdlib=libc++

# OpenMP flags

OMPFLAGS = 

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

git_OVERRIDE = TRUE
git_VERSION = 1.7.12.4-apple

blas_OVERRIDE = TRUE
blas_VERSION = 10.8-apple
blas_LIBS_CC = -Wl,-framework,vecLib
blas_LIBS_CXX = -Wl,-framework,vecLib
blas_LIBS_F77 = -Wl,-framework,vecLib
blas_LIBS_FC = -Wl,-framework,vecLib

lapack_OVERRIDE = TRUE
lapack_VERSION = 10.8-apple


# override packages provided by macports

macports = /opt/local

autoconf_OVERRIDE = TRUE
autoconf_VERSION = 2.69
autoconf_PREFIX = $(macports)

automake_OVERRIDE = TRUE
automake_VERSION = 1.14
automake_PREFIX = $(macports)

boost_OVERRIDE = TRUE
boost_VERSION = 1.55.0
boost_PREFIX = $(macports)

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6
bzip2_PREFIX = $(macports)

cfitsio_OVERRIDE = TRUE
cfitsio_VERSION = 3.340
cfitsio_PREFIX = $(macports)

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.12
cmake_PREFIX = $(macports)

curl_OVERRIDE = TRUE
curl_VERSION = 7.33.0
curl_PREFIX = $(macports)

eigen_OVERRIDE = TRUE
eigen_VERSION = 3.2.0
eigen_PREFIX = $(macports)

expat_OVERRIDE = TRUE
expat_VERSION = 2.1.0
expat_PREFIX = $(macports)

fftw_OVERRIDE = TRUE
fftw_VERSION = 3.3.3
fftw_PREFIX = $(macports)

gdb_OVERRIDE = TRUE
gdb_VERSION = 6.3.50

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.18.3.1
gettext_PREFIX = $(macports)

gsl_OVERRIDE = TRUE
gsl_VERSION = 1.16
gsl_PREFIX = $(macports)

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.6
gzip_PREFIX = $(macports)

h5py_OVERRIDE = TRUE
h5py_VERSION = 2.2.0
h5py_PREFIX = $(macports)

hdf5_OVERRIDE = TRUE
hdf5_VERSION = 1.8.11
hdf5_PREFIX = $(macports)

ipython_OVERRIDE = TRUE
ipython_VERSION = 1.1.0
ipython_PREFIX = $(macports)

libarchive_OVERRIDE = TRUE
libarchive_VERSION = 3.1.2
libarchive_PREFIX = $(macports)

libjpeg_OVERRIDE = TRUE
libjpeg_VERSION = 1.2.1
libjpeg_PREFIX = $(macports)

libtool_OVERRIDE = TRUE
libtool_VERSION = 2.4.2
libtool_PREFIX = $(macports)

m4_OVERRIDE = TRUE
m4_VERSION = 1.4.16
m4_PREFIX = $(macports)

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.3.1
matplotlib_PREFIX = $(macports)

mysql_client_OVERRIDE = TRUE
mysql_client_VERSION = 1.2.3
mysql_client_PREFIX = $(macports)

mysql_python_OVERRIDE = TRUE
mysql_python_VERSION = 1.2.3
mysql_python_PREFIX = $(macports)

netcdf_OVERRIDE = TRUE
netcdf_VERSION = 4.3.0
netcdf_PREFIX = $(macports)

nose_OVERRIDE = TRUE
nose_VERSION = 1.3.0
nose_PREFIX = $(macports)

numexpr_OVERRIDE = TRUE
numexpr_VERSION = 2.2.2
numexpr_PREFIX = $(macports)

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.8.0
numpy_PREFIX = $(macports)

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.7.3
openmpi_PREFIX = $(macports)
MPICC = mpicc
MPICXX = mpicxx

openssl_OVERRIDE = TRUE
openssl_VERSION = 1.0.1e
openssl_PREFIX = $(macports)

pcre_OVERRIDE = TRUE
pcre_VERSION = 8.33
pcre_PREFIX = $(macports)

plplot_OVERRIDE = TRUE
plplot_VERSION = 5.9.9
plplot_PREFIX = $(macports)

postgresql_OVERRIDE = TRUE
postgresql_VERSION = 9.2.5
postgresql_PREFIX = $(macports)

psycopg2_OVERRIDE = TRUE
psycopg2_VERSION = 2.5.1
psycopg2_PREFIX = $(macports)

pyfits_OVERRIDE = TRUE
pyfits_VERSION = 3.2
pyfits_PREFIX = $(macports)

python_OVERRIDE = TRUE
python_VERSION = 2.7.6
python_PREFIX = $(macports)

readline_OVERRIDE = TRUE
readline_VERSION = 6.2.000
readline_PREFIX = $(macports)

scientific_OVERRIDE = TRUE
scientific_VERSION = 2.9.2
scientific_PREFIX = $(macports)

scipy_OVERRIDE = TRUE
scipy_VERSION = 0.13.1
scipy_PREFIX = $(macports)

sqlite_OVERRIDE = TRUE
sqlite_VERSION = 3.8.1.0
sqlite_PREFIX = $(macports)

swig_OVERRIDE = TRUE
swig_VERSION = 2.0.11
swig_PREFIX = $(macports)

tcsh_OVERRIDE = TRUE
tcsh_VERSION = 6.18.01
tcsh_PREFIX = $(macports)

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.6.1
tcl_PREFIX = $(macports)

tk_OVERRIDE = TRUE
tk_VERSION = 8.6.1
tk_PREFIX = $(macports)

urwid_OVERRIDE = TRUE
urwid_VERSION = 1.1.1
urwid_PREFIX = $(macports)

valgrind_OVERRIDE = TRUE
valgrind_VERSION = 3.9.0
valgrind_PREFIX = $(macports)

wcslib_OVERRIDE = TRUE
wcslib_VERSION = 4.17
wcslib_PREFIX = $(macports)

wcstools_OVERRIDE = TRUE
wcstools_VERSION = 3.8.7
wcstools_PREFIX = $(macports)

wget_OVERRIDE = TRUE
wget_VERSION = 1.14

xpa_OVERRIDE = TRUE
xpa_VERSION = 2.1.11

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.8
zlib_PREFIX = $(macports)





