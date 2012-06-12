
# HPC ports common

HPCP = [HPCP]

ifndef BUILD_DYNAMIC
	export BUILD_DYNAMIC = TRUE
endif

ifndef TOOLCHAIN
	export TOOLCHAIN = gnu
endif

# various system tool defaults

ifndef MAKE
	export MAKE = make
endif

ifndef SHELL
	export SHELL = /bin/sh
endif

ifndef CURL
	export CURL = curl
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
