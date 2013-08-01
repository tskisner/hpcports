
.. _advanced:

Advanced Topics
==================================

Sometimes you need to know the details, and sometimes bad things happen to your installed software location.  Here is some information that may help your efforts.

Module Naming Collisions
----------------------------



Special Considerations for OS X
-----------------------------------

The current compiler situation (old versions, lack of Fortran support) on OS X leads to some particularly challenging problems for anyone who wants to build software using non-Apple-supported compilers.  One challenge in particular is that any packages that link to Apple system libraries generally need to be built with the Apple compilers.  One such package is matplotlib.  Here are several possible scenarios depending on what you want to do:

Scenario 1
^^^^^^^^^^^^^^^

You only want a few packages from HPCPorts, and in particular you do not need any of the python packages.

#.  Use Macports to install a newer version of gcc / g++ / gfortran.  For example, version 4.7.3.

#.  Use Macports to install python, matplotlib, numpy, etc.

#.  Configure HPCPorts to use the newer compilers.  Simply do not build any packages that depend on python.

Scenario 2
^^^^^^^^^^^^^^^

You want to use packages in HPCPorts that link to libpython or otherwise depend on / interact with python.

#.  Use Macports to install a newer version of gcc / g++ / gfortran.  For example, version 4.7.3.

#.  Configure HPCPorts to use the newer compilers.  Build any packages you like, including python.  The only package that will not build is matplotlib, since it tries to link to system GUI libraries which are incompatible with the newer compilers.  You must put in a fake Override for matplotlib in your system .make file::

	matplotlib_OVERRIDE = TRUE
	matplotlib_VERSION = NA

#.  If you still want to use matplotlib, you will have to install a full python stack from Macports.  You can switch between the two python installations by loading / unloading the relevant HPCPorts modules.

Reproducing Old Versions
----------------------------

If you continuously update your HPCPorts git repo and install new versions of packages, the old versions are not uninstalled, but the latest version of all packages is the default.  Anyone using an old version can simply manually load the old version of a package and it should load all of the correct versions of its dependencies.

However, what if you accidentally wiped all those old versions or you need to install those older versions on a new machine?  The solution in this case is to checkout the correct git version of HPCPorts when those old packages were the default, and install as usual.

.. todo:: What about module versions?  Need a way to install old versions without making them the default...


Cross Compilation
--------------------


Running Without Modules
---------------------------


