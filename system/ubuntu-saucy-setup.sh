#!/bin/bash

# List of dependencies

DEPS="\
environment-modules \
python-astropy \
autoconf \
automake \
libopenblas-dev \
libboost1.54-all-dev \
bzip2 \
libbz2-dev \
libcfitsio3-dev \
cmake \
libcurl4-openssl-dev \
cython \
libeigen3-dev \
libexpat1-dev \
libfftw3-dev \
gdb \
git \
libgsl0-dev \
gzip \
python-h5py \
libhdf5-dev \
ipython \
libopenblas-dev \
liblapack-dev \
libarchive-dev \
libjpeg-dev \
libtiff5-dev \
libtool \
m4 \
python-matplotlib \
python-mpi4py \
mysql-client \
python-mysqldb \
libnetcdf-dev \
python-numpy \
python-numexpr \
libpcre3-dev \
libplplot-dev \
postgresql-client \
python-psycopg2 \
python-pyfits \
python-scientific \
python-scipy \
scons \
screen \
python-setuptools \
sfftw-dev \
sqlite \
libsqlite3-dev \
swig \
tcsh \
tcl8.6 \
tk8.6 \
python-urwid \
valgrind \
wcslib-dev \
libwcstools-dev \
xpa-tools \
libxpa1 \
zlib1g-dev"

# install

apt-get install ${DEPS}

