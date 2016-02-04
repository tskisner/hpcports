
# HPC ports common

HPCP = --->

ifndef BUILD_DYNAMIC
	export BUILD_DYNAMIC = TRUE
endif

ifndef BUILD_FORTRAN
	export BUILD_FORTRAN = TRUE
endif

ifndef TOOLCHAIN
	export TOOLCHAIN = gnu
endif

ifndef HPCP_MOD_SUFFIX
	export HPCP_MOD_SUFFIX =
endif

ifndef INST_GRP
	export INST_GRP = 
endif

ifndef INST_PERM
	export INST_PERM = 
endif

# special case:  we need to know the python site directory.  Override this in
# the system file if needed:

ifndef python_SITE
	export python_SITE = python2.7
endif

# various system tool defaults

ifndef MAKE
	export MAKE = make -s
endif

ifndef WGET
	export WGET = wget --no-check-certificate
endif

ifndef SHELL
	export SHELL = /bin/bash
endif

ifndef MD5
	export MD5 = md5sum
endif

ifndef PATCH
	export PATCH = patch
endif

ifndef GIT
	export GIT = git
endif

ifndef GXTAR
	export GXTAR = tar xzf
endif

ifndef GCTAR
	export GCTAR = tar czf
endif

ifndef BXTAR
	export BXTAR = tar xjf
endif

ifndef BCTAR
	export BCTAR = tar cjf
endif

ifndef UZIP
	export UZIP = unzip -d
endif

ifndef ZIP
	export ZIP = zip -r
endif

# extra options passed to OpenMPI configure.  Default is nothing

ifndef openmpi_EXTRA
	export openmpi_EXTRA =
endif

# host variable used for cross compiling

ifndef HPCP_CROSS_HOST
	export HPCP_CROSS_HOST =
endif

# compilers used to target build system, for use in
# constructing tools that are only used on the build machine

ifndef BUILD_CC
	export BUILD_CC = $(CC)
endif

ifndef BUILD_CXX
	export BUILD_CXX = $(CXX)
endif

ifndef BUILD_FC
	export BUILD_FC = $(FC)
endif

ifndef BUILD_F77
	export BUILD_F77 = $(F77)
endif

