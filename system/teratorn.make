
ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = gcc463

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
openmpi_VERSION = 1.6
MPICC = mpicc
MPICXX = mpicxx
MPIF77 = mpif77
MPIFC = mpif90

# compile flags

CFLAGS = -O0 -g -m64 -fPIC
CXXFLAGS = -O0 -g -m64 -fPIC
FFLAGS = -O0 -g -m64 -fPIC
FCFLAGS = -O0 -g -m64 -fPIC

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran -lgfortranbegin
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LDFLAGS = -L/ports/lib

# vendor math libraries

VENDOR = apple
APPLE_CPPFLAGS =
APPLE_LDFLAGS = -Wl,-framework,Accelerate
APPLE_LIBS_CC =
APPLE_LIBS_CXX =
APPLE_LIBS_F77 =
APPLE_LIBS_FC =

# package overrides

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.5-apple

blas_OVERRIDE = TRUE
blas_VERSION = 10.7.4-apple
blas_LDFLAGS = $(APPLE_LDFLAGS)

lapack_OVERRIDE = TRUE
lapack_VERSION = 10.7.4-apple
lapack_LDFLAGS = $(APPLE_LDFLAGS)

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.18.1.1-macports
gettext_CPPFLAGS = -I/ports/include
gettext_LDFLAGS = -L/ports/lib

readline_OVERRIDE = TRUE
readline_VERSION = 6.2.2-macports
readline_CPPFLAGS = -I/ports/include
readline_LDFLAGS = -L/ports/lib

curl_OVERRIDE = TRUE
curl_PREFIX = /ports
curl_VERSION = 7.26.0-macports

python_OVERRIDE = TRUE
python_PREFIX = /ports
python_VERSION = 2.7.3-macports

ipython_OVERRIDE = TRUE
ipython_PREFIX = /ports
ipython_VERSION = 0.13-macports

boost_OVERRIDE = TRUE
boost_PREFIX = /ports
boost_VERSION = 1.50-macports
boost_CPPFLAGS = -I/ports/include
boost_LDFLAGS = -L/ports/lib

zlib_OVERRIDE = TRUE
zlib_PREFIX = /ports
zlib_VERSION = 1.2.7-macports
zlib_CPPFLAGS = -I/ports/include
zlib_LDFLAGS = -L/ports/lib

bzip2_OVERRIDE = TRUE
bzip2_PREFIX = /ports
bzip2_VERSION = 1.0.6-macports
bzip2_CPPFLAGS = -I/ports/include
bzip2_LDFLAGS = -L/ports/lib

sqlite_OVERRIDE = TRUE
sqlite_PREFIX = /ports
sqlite_VERSION = 3.7.13-macports
sqlite_CPPFLAGS = -I/ports/include
sqlite_LDFLAGS = -L/ports/lib

expat_OVERRIDE = TRUE
expat_PREFIX = /ports
expat_VERSION = 2.1.0-macports
expat_CPPFLAGS = -I/ports/include
expat_LDFLAGS = -L/ports/lib

libtool_OVERRIDE = TRUE
libtool_PREFIX = /ports
libtool_VERSION = 2.4.2-macports
libtool_CPPFLAGS = -I/ports/include
libtool_LDFLAGS = -L/ports/lib

automake_OVERRIDE = TRUE
automake_PREFIX = /ports
automake_VERSION = 1.12.2-macports
automake_CPPFLAGS = -I/ports/include
automake_LDFLAGS = -L/ports/lib

autoconf_OVERRIDE = TRUE
autoconf_PREFIX = /ports
autoconf_VERSION = 2.69-macports
autoconf_CPPFLAGS = -I/ports/include
autoconf_LDFLAGS = -L/ports/lib

m4_OVERRIDE = TRUE
m4_PREFIX = /ports
m4_VERSION = 1.4.16-macports
m4_CPPFLAGS = -I/ports/include
m4_LDFLAGS = -L/ports/lib

openssl_OVERRIDE = TRUE
openssl_VERSION = 1.0.1c-macports
openssl_PREFIX = /ports

nose_OVERRIDE = TRUE
nose_VERSION = 1.1.2-macports

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.1.0-macports

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.4-macports

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.6.2-macports

fftw_OVERRIDE = TRUE
fftw_PREFIX = /ports
fftw_VERSION = 3.3.2-macports
fftw_CPPFLAGS = -I/ports/include
fftw_LDFLAGS = -L/ports/lib
fftw_LIBS_CC = -lfftw3_threads -lfftw3
fftw_LIBS_CXX = -lfftw3_threads -lfftw3
fftw_LIBS_F77 = -lfftw3_threads -lfftw3
fftw_LIBS_FC = -lfftw3_threads -lfftw3

cfitsio_OVERRIDE = TRUE
cfitsio_PREFIX = /ports
cfitsio_VERSION = 3.3.0-macports
cfitsio_CPPFLAGS = -I/ports/include
cfitsio_LDFLAGS = -L/ports/lib
cfitsio_LIBS_CC = -lcfitsio
cfitsio_LIBS_CXX = -lcfitsio
cfitsio_LIBS_F77 = -lcfitsio
cfitsio_LIBS_FC = -lcfitsio

