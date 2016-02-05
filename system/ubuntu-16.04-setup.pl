#!/usr/bin/env perl

use strict;

# List of dependencies

# these are broken...
# "libgnutls-dev" => "openssl",

my $DEPS = {
"environment-modules" => "",
"python-astropy" => "astropy",
"autoconf" => "autoconf",
"automake" => "automake",
"libopenmpi-dev" => "openmpi",
"libopenblas-dev" => "blas",
"libboost1.58-all-dev" => "boost",
"bzip2" => "bzip2",
"libbz2-dev" => "",
"libcfitsio3-dev" => "cfitsio",
"cmake" => "cmake",
"libcurl4-openssl-dev" => "curl",
"cython" => "cython",
"libeigen3-dev" => "eigen",
"libexpat1-dev" => "expat",
"libfftw3-dev" => "fftw",
"gdb" => "gdb",
"git" => "git",
"libgsl0-dev" => "gsl",
"gzip" => "gzip",
"python-h5py" => "h5py",
"libhdf5-dev" => "hdf5",
"ipython" => "ipython",
"liblapack-dev" => "lapack",
"libarchive-dev" => "libarchive",
"libjpeg-dev" => "libjpeg",
"libtiff5-dev" => "libtiff",
"libtool" => "libtool",
"m4" => "m4",
"python-matplotlib" => "matplotlib",
"python-mpi4py" => "mpi4py",
"mysql-client" => "mysql_client",
"python-mysqldb" => "mysql_python",
"libnetcdf-dev" => "netcdf",
"python-numpy" => "numpy",
"python-numexpr" => "numexpr",
"libpcre3-dev" => "pcre",
"libplplot-dev" => "plplot",
"postgresql-client" => "postgresql",
"python-psycopg2" => "psycopg2",
"python" => "python",
"python-scientific" => "scientific",
"python-scipy" => "scipy",
"scons" => "scons",
"screen" => "screen",
"python-setuptools" => "setuptools",
"sfftw-dev" => "sfftw",
"sqlite" => "",
"libsqlite3-dev" => "sqlite",
"swig" => "swig",
"tcsh" => "tcsh",
"tcl8.6" => "tcl",
"tk8.6" => "tk",
"python-urwid" => "urwid",
"valgrind" => "valgrind",
"wcslib-dev" => "wcslib",
"libwcstools-dev" => "wcstools",
"xpa-tools" => "xpa",
"libreadline-dev" => "readline",
"libxml2-dev" => "libxml2",
"python-nose" => "nose",
"libxpa1" => "",
"zlib1g-dev" => "zlib" };

use Data::Dumper;

#print Dumper ( $DEPS );

# install

my $install = join ( " ", keys( %{$DEPS} ) );
system( "sudo apt-get install ${install}" );

# enable the environment modules

system( "add.modules" );

# generate override info

system( "cp ubuntu-16.04.make.in ubuntu-16.04.make" );

open(OUT, ">>ubuntu-16.04.make");

foreach my $linux ( keys %{$DEPS} ) {
	my $hpcp = $DEPS->{$linux};
	if ( $hpcp ne "" ) {
		my $ver = `apt-cache show ${linux} | grep -e "^Version*"`;
		$ver =~ s/(.*)\n.*/$1/;
		chomp($ver);
		$ver =~ s/.*:\s*([^+^-]*).*/$1/;
		print OUT "${hpcp}_OVERRIDE = TRUE\n";
		print OUT "${hpcp}_PREFIX = \$(root)\n";
		print OUT "${hpcp}_VERSION = ${ver}\n";
		print OUT "\n";
	}
}

close (OUT);
