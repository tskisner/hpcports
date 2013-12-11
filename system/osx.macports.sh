#!/bin/bash

# install the packages

port install \
autoconf \
automake \
python27 \
openmpi -gcc48 \
bzip2 \
cfitsio \
cmake \
curl \
eigen3 \
expat \
fftw-3 \
gettext \
gsl \
gzip \
hdf5-18 \
jpeg \
libarchive \
libtool \
m4 \
mysql5 \
netcdf \
openssl \
pcre \
plplot \
postgresql92 \
py27-h5py \
py27-ipython \
py27-matplotlib \
py27-mysql \
py27-nose \
py27-numexpr \
py27-numpy \
py27-psycopg2 \
py27-pyfits \
py27-scientific \
py27-scipy \
py27-urwid \
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

port select --set python python27
