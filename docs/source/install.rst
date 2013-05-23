
.. _install:

Installation and Setup
==================================

HPCPorts consists entirely of interpreted code, so there is nothing to "install".  Essentially you just clone the git repository and then optionally update your shell path so that you can run the hpcp command from anywhere.  You must also set up a config file for your system.

Prerequisites
-----------------

Before using HPCPorts, you should install the Environment Modules software package (http://modules.sourceforge.net).  There are other requirements that should be available on most systems:

* A working "wget" executable.
* Perl.
* Bash.
* GNU make.

Get the Source
------------------

The first step is to clone the repo::

	$> git clone git://github.com/tskisner/hpcports.git

Alternatively, you can download a zip file from github if you do not have git installed yet.

System Configuration
------------------------

After you have a copy of HPCPorts, you need to set up the configuration for the machine you will be using it on.  Go into the system directory.  For the purposes of this example, let's say that your machine is named "blah".  Copy the example files to a new set for your machine::

	$> cp example.make blah.make

The optional .module and .sh files contain any setup commands that need to be run before using any software installed by HPCPorts.  They are empty by default, but you can look at the other files for examples of their contents.  The .make file is what you should edit next.  The example file assumes that you are using gcc / g++ / gfortran and installing everything else from HPCPorts.  You should at least edit the HPCP_PREFIX variable to point to where you want to install the packages built by HPCPorts, and also change the HPCP_POOL variable to the directory where HPCPorts should put package source that it downloads.

.. warning::

	The HPCP_PREFIX and HPCP_POOL directories should be separate, stand-alone places that only contain files managed by HPCPorts.  DO NOT use places like /usr for these.  If you want to install in a system-wide location outside your home directory, I recommend setting HPCP_PREFIX to /usr/local/hpcports and HPCP_POOL to /usr/local/hpcports_pool.

Vendor Math Libraries
-------------------------



Overriding Packages
-----------------------

In some cases, you only want to install certain packages from HPCPorts and you would like to use software already installed on the system to meet any dependencies.  This functionality is provided by "Overriding" certain packages in the system .make file.

.. warning::

	You should only do this if you are certain that the external software is compatible with the compiler you are using with HPCPorts.  In particular, if you are overriding OpenMPI or Python, these external packages need to be built with exactly the same compiler you are using for HPCPorts.

When overriding a package, you should at the very least specify a version for the external package.  This will ensure correct generation of the module files used to represent this external package in the dependency chain.  For example, let's say you want to override the "cmake" package to point the already-installed version on your linux box.  In your system .make file, you might put::

	cmake_OVERRIDE = TRUE
	cmake_VERSION = 2.8.8

This is all you need, since this package just provides an executable, and it is already installed in your default path.  Let's look at a more complicated example.  Suppose that you have installed your own copy of the Healpix package in /home/user/healpix and you want to use this in place of the HPCPorts version.  Since this package has C, C++, and Fortran libraries and is installed to a non-standard location, we have to give more information::

	healpix_OVERRIDE = TRUE
	healpix_VERSION = 3.0
	healpix_PREFIX = /home/user/healpix
	healpix_BIN = bin
	healpix_INCLUDE = include
	healpix_LIB = lib
	healpix_DATA = share/healpix
	healpix_LIBS_CC = -lchealpix
	healpix_LIBS_CXX = -lhealpix_cxx -lcxxsupport -lfftpack
	healpix_LIBS_FC = -lhealpix
	healpix_LIBS_MPIFC = -lhealpix-mpi

The module file that HPCPorts creates for this overridden healpix package will now contain all the needed information for packages that depend on it.  Loading this generated healpix module will correctly modify PATH, CPATH, LIBRARY_PATH, LD_LIBRARY_PATH, and set other variables containing the library linking commands.  There are two "special cases" of package overrides:  openmpi and python.  In the case of openmpi, you can actually override this with ANY MPI implementation.  The critical variables to define are MPI compiler wrappers and any language mixing flags::

	openmpi_OVERRIDE = TRUE
	openmpi_VERSION = 1.4.5
	MPICC = mpicc
	MPICXX = mpicxx
	MPIF77 = mpif77
	MPIFC = mpif90
	MPIFCLIBS = -lmpi_f90 -lmpi_f77

Another example, this time on a Cray system where we are using the Cray-provided compiler wrappers which use their modified version of MPICH2::

	openmpi_OVERRIDE = TRUE
	openmpi_VERSION = cray.mpich2
	MPICC = cc
	MPICXX = CC
	MPIF77 = ftn
	MPIFC = ftn
	MPIFCLIBS =

When overriding python, you must specify the string to use for the site packages subdirectory.  For example::

	python_OVERRIDE = TRUE
	python_VERSION = 2.7.1
	python_SITE = python2.7




Using the Tools
------------------

There is one final step to before being able to manage packages and also to use the installed modules created by HPCPorts.  Edit your ~/.bashrc file and add the location of the git checkout to your PATH and also append the installed module location to your module search path.  Obviously change the lines below to match the location of your git checkout and HPCP_PREFIX::

	# For access to the hpcp command
	export PATH=${PATH}:/home/user/git/hpcports

	# To use HPCPorts installed modules
	module use /home/user/hpcports/env/modulefiles

After making these changes, from a new shell, you can now do::

	$> hpcp status

Once you have installed some packages, typing "module avail" should show all the modules installed by HPCPorts.

Uninstalling
----------------

Uninstalling HPCPorts is easy.  First, comment out or remove the modifications to ~/.bashrc that you made in the previous section.  Next completely remove the HPCP_PREFIX and HPCP_POOL directories.  Finally, remove the hpcports git repo.


