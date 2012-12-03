
ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = homebrew

# software download location

HPCP_POOL = /data/software/hpcports_pool

# UNIX tools

MD5 = md5
MAKE = make

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = darwin

# permissions on installed files

INST_GRP = staff
INST_PERM = a+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = 1.6.2
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O2 -g -m64 -fPIC
CXXFLAGS = -O2 -g -m64 -fPIC
FFLAGS = -O2 -g -m64 -fPIC
FCFLAGS = -O2 -g -m64 -fPIC

# OpenMP flags

OMPFLAGS =

# Fortran mixing

FCLIBS = -L/usr/local/Cellar/gfortran/4.7.2/gfortran/lib -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LDFLAGS = -L/ports/lib

# vendor math libraries

VENDOR = apple
APPLE_CPPFLAGS =
APPLE_LDFLAGS = 
APPLE_LIBS_CC = -Wl,-framework,Accelerate 
APPLE_LIBS_CXX = -Wl,-framework,Accelerate
APPLE_LIBS_F77 = -Wl,-framework,Accelerate
APPLE_LIBS_FC = -Wl,-framework,Accelerate

# package overrides

gdb_OVERRIDE = TRUE
gdb_VERSION = 6.3.50

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.5-apple

cmake_OVERRIDE = TRUE
cmake_VERSION = 2.8.10-brew

blas_OVERRIDE = TRUE
blas_VERSION = 10.7.5-apple
blas_LIBS_CC = -Wl,-framework,vecLib
blas_LIBS_CXX = -Wl,-framework,vecLib
blas_LIBS_F77 = -Wl,-framework,vecLib
blas_LIBS_FC = -Wl,-framework,vecLib

gettext_OVERRIDE = TRUE
gettext_VERSION = 10.7.5-apple

readline_OVERRIDE = TRUE
readline_VERSION = 10.7.5-apple

curl_OVERRIDE = TRUE
curl_VERSION = 10.7.5-apple

python_OVERRIDE = TRUE
python_PREFIX = /usr
python_VERSION = 2.7.1-apple

boost_OVERRIDE = TRUE
boost_PREFIX = /usr/local
boost_VERSION = 1.52-brew
boost_CPPFLAGS = -I/usr/local/include
boost_LDFLAGS = -L/usr/local/lib

zlib_OVERRIDE = TRUE
zlib_VERSION = 10.7.5-apple

libtiff_OVERRIDE = TRUE
libtiff_PREFIX = /usr/local
libtiff_VERSION = 4.0.3

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 10.7.5-apple

sqlite_OVERRIDE = TRUE
sqlite_PREFIX = /usr/local
sqlite_VERSION = 3.7.14-brew
sqlite_CPPFLAGS = -I/usr/local/include
sqlite_LDFLAGS = -L/usr/local/lib

expat_OVERRIDE = TRUE
expat_PREFIX = /usr/local
expat_VERSION = 2.1.0-brew
expat_CPPFLAGS = -I/usr/local/include
expat_LDFLAGS = -L/usr/local/lib

tcl_OVERRIDE = TRUE
tcl_VERSION = 10.7.5-apple

tk_OVERRIDE = TRUE
tk_VERSION = 10.7.5-apple

libtool_OVERRIDE = TRUE
libtool_PREFIX = /usr/local
libtool_VERSION = 2.4.2-brew
libtool_CPPFLAGS = -I/usr/local/include
libtool_LDFLAGS = -L/usr/local/lib

automake_OVERRIDE = TRUE
automake_VERSION = 1.12.5-brew

autoconf_OVERRIDE = TRUE
autoconf_VERSION = 2.69-brew

m4_OVERRIDE = TRUE
m4_VERSION = 10.7.5-apple

openssl_OVERRIDE = TRUE
openssl_VERSION = 10.7.5-apple

gzip_OVERRIDE = TRUE
gzip_VERSION = 10.7.5-apple

cfitsio_OVERRIDE = TRUE
cfitsio_PREFIX = /usr/local
cfitsio_VERSION = 3.3.0-brew
cfitsio_CPPFLAGS = -I/usr/local/include
cfitsio_LDFLAGS = -L/usr/local/lib
cfitsio_LIBS_CC = -lcfitsio
cfitsio_LIBS_CXX = -lcfitsio
cfitsio_LIBS_F77 = -lcfitsio
cfitsio_LIBS_FC = -lcfitsio

