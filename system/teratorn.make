
ifndef HPCP_PREFIX
  HPCP_PREFIX := /data/software/hpcports
endif

# OS environment version

HPCP_ENV = gcc48

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

CFLAGS = -O2 -g -m64 -fPIC
CXXFLAGS = -O2 -g -m64 -fPIC
FFLAGS = -O2 -g -m64 -fPIC
FCFLAGS = -O2 -g -m64 -fPIC

# OpenMP flags

OMPFLAGS =

# Fortran mixing

FCLIBS = -lgfortran
MPIFCLIBS = -lmpi_f90 -lmpi_f77

# Linking

LDFLAGS =

# vendor math libraries

VENDOR = apple
APPLE_CPPFLAGS =
APPLE_LDFLAGS = 
APPLE_LIBS_CC = -Wl,-framework,Accelerate 
APPLE_LIBS_CXX = -Wl,-framework,Accelerate
APPLE_LIBS_F77 = -Wl,-framework,Accelerate
APPLE_LIBS_FC = -Wl,-framework,Accelerate

# package overrides

gitgit_OVERRIDE = TRUE
gitgit_VERSION = 1.7.7.5-apple

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

zlib_OVERRIDE = TRUE
zlib_VERSION = 10.7.5-apple

bzip2_OVERRIDE = TRUE
bzip2_VERSION = 10.7.5-apple

tcl_OVERRIDE = TRUE
tcl_VERSION = 10.7.5-apple

tk_OVERRIDE = TRUE
tk_VERSION = 10.7.5-apple

openssl_OVERRIDE = TRUE
openssl_VERSION = 10.7.5-apple

gzip_OVERRIDE = TRUE
gzip_VERSION = 10.7.5-apple

