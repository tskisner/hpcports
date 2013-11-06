#!/bin/bash

# install the packages

port install \
autoconf \
automake \
boost \
bzip2 \
cfitsio \
curl \
eigen3-devel \
expat \
fftw-3 \
gettext \
gsl-devel \
gzip \
hdf5-18 \
libarchive \
libjpeg-turbo \
libtool \
m4 \
mysql5 \
netcdf \
openmpi \
openssl \
pcre \
plplot \
postgresql92 \
py27-h5py \
py27-healpy \
py27-ipython \
py27-matplotlib \
py27-mpi4py \
py27-mysql \
py27-nose \
py27-numexpr \
py27-numpy \
py27-psycopg2 \
py27-pyfits \
py27-rpy2 \
py27-scientific \
py27-scipy \
py27-urwid \
python27 \
readline \
sqlite3 \
swig \
tcsh \
tcl \
tk \
valgrind \
wcslib \
wcstools \
wget \
xpa \
zlib

# make sure macports python 2.7 is default

port select set python python27
