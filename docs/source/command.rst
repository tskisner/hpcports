
.. _command:

Available Commands
==================================

Standard software management operations consist of installing and removing packages, updating packages to new versions, and querying packages for the versions, dependencies, and installation state.  Here is how to perform these operations with HPCPorts.

Status 
--------------------------

Shows the version and installation status of all packages.  Also displays the current system file (HPCP_HOST) that is in use::

	$> hpcp status
	---> ---------------------------------------------------------
	---> HPCP_HOST = "teratorn", HPCP_ENV = "gcc473"
	---> ---------------------------------------------------------
	--->          Package |              Version |  State
	---> ---------------------------------------------------------
	--->             hpcp |               gcc473 |  installed
	--->                R |      2.15.3_77663f64 |  purged
	--->         appspack |    5.0.1-C3_39026d4e |  purged
	--->       astromatic |             92f2ae4b |  installed
	--->       astrometry |        0.38_28509589 |  purged
	(snipped)
	--->              xpa |      2.1.14_f577707c |  purged
	--->             zlib |                1.2.7 |  installed

The possible states are

* purged     : Not installed and source tree not extracted
* extracted  : Source tree is extracted
* patched    : Source tree is extracted and patched
* configured : Source tree is extracted, patched, and configured
* built      : Source tree is extracted, patched, configured, and built
* installed  : Installed and source tree in indeterminant state
* stale      : Source is out of date, and will be purged before next operation

Info
--------------------------

Shows detailed information about one or more packages.  This includes the version, state, and list of fully expanded dependencies::

	$> hpcp info boost
	---> 
	--->          Name:  boost
	--->       Version:  1.52.0_2e272961-gcc473
	--->         State:  installed
	--->  Dependencies:
	--->                 blas | 10.7.5-apple-gcc473
	--->               lapack | 3.4.1_524a882f-gcc473
	--->                   m4 | 1.4.16-gcc473
	--->             autoconf | 2.69_cb56a547-gcc473
	--->             automake | 1.12.6_b9d0ae94-gcc473
	--->              libtool | 2.4.2-gcc473
	--->              openmpi | 1.7.1_0d99d93f-gcc473
	--->                 fftw | 3.3.3_852f3906-gcc473
	--->             readline | 6.2_4f2c7b0d-gcc473
	--->               sqlite | 3.7.15.1_f577707c-gcc473
	--->               python | 2.7.3_14cc07f1-gcc473
	--->                 nose | 1.1.2_4ea20b2e-gcc473
	--->                numpy | 1.6.2_fccbe115-gcc473
	---> 

Purge
---------

Purge the entire staging directory for the package(s), including the extracted source tree and generated module files.  This does not impact software that is already installed, so you can run this command after installation to reduce disk space::

	$> hpcp purge lapack blas
	--->         lapack :  Purging
	--->           blas :  Purging

Install
-----------

Install each of the specified packages, starting at the current state.  All dependencies will be installed in the correct order.  If the package is stale, it will be purged first.  If it is already installed, then this command does nothing.  In the example below the blas package is overridden, so only the generated module file will be installed::

	$> hpcp install lapack
	--->           blas :  Overriding
	--->           blas :  Installing Override
	--->         lapack :  Extracting
	--->         lapack :  Patching
	--->         lapack :  Configuring
	--->         lapack :  Uninstalling
	--->         lapack :  Building
	--->         lapack :  Installing

Uninstall
--------------

Uninstall the specified packages.  The state of the extracted source trees are not touched::

	$> hpcp uninstall lapack blas
	--->         lapack :  Uninstalling
	--->           blas :  Uninstalling Override

Fetch
----------

Download the source trees for the specified packages.  This is useful if you want to download many packages to the pool location while connected to the network and then install them later while offline::

	$> hpcp fetch lapack blas
	--->         lapack :  Fetching tarball
	--->           blas :  Fetching tarball

Clean
----------

Run "make clean" on the source trees of the specified packages.  This is not typically used except for debugging.


