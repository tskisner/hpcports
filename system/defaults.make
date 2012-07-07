
# HPC ports common

HPCP = --->

ifndef BUILD_DYNAMIC
	export BUILD_DYNAMIC = TRUE
endif

ifndef TOOLCHAIN
	export TOOLCHAIN = gnu
endif

ifndef MOD_SUFFIX
	export MOD_SUFFIX =
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
