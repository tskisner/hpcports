# This assumes that macports is used, and that the following ports are installed:
#	gcc47
#   python27
#   py27-numpy
#   py27-matplotlib
#   py27-ipython
#	gzip
#


ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = gcc472

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

# compile flags

CFLAGS = -O2 -m64 -g -fPIC
CXXFLAGS = -O2 -m64 -g -fPIC
FFLAGS = -O2 -m64 -g -fPIC
FCFLAGS = -O2 -m64 -g -fPIC

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

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
gitgit_VERSION = 1.7.10.2-apple

blas_OVERRIDE = TRUE
blas_VERSION = 10.7.5-apple
blas_LIBS_CC = -Wl,-framework,vecLib
blas_LIBS_CXX = -Wl,-framework,vecLib
blas_LIBS_F77 = -Wl,-framework,vecLib
blas_LIBS_FC = -Wl,-framework,vecLib

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.18.2-macports

readline_OVERRIDE = TRUE
readline_VERSION = 6.2.000-macports

curl_OVERRIDE = TRUE
curl_VERSION = 7.28.1-macports

zlib_OVERRIDE = TRUE
zlib_VERSION = 1.2.7-macports

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 1.0.6-macports

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.6.0-macports

tk_OVERRIDE = TRUE
tk_VERSION = 8.6.0-macports

openssl_OVERRIDE = TRUE
openssl_VERSION = 1.0.1c-macports

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.5.0-macports

sqlite_OVERRIDE = TRUE
sqlite_VERSION = 3.7.15-macports

python_OVERRIDE = TRUE
python_VERSION = 2.7.3-macports

nose_OVERRIDE = TRUE
nose_VERSION = 1.2.1-macports

numpy_OVERRIDE = TRUE
numpy_VERSION = 1.6.2-macports

matplotlib_OVERRIDE = TRUE
matplotlib_VERSION = 1.2.0-macports

ipython_OVERRIDE = TRUE
ipython_VERSION = 0.13.1-macports

scientific_OVERRIDE = TRUE
scientific_VERSION = 2.9.1-macports




