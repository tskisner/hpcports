
# various system tool defaults

ifndef MAKE
	export MAKE = make
endif

ifndef SHELL
	export SHELL = /bin/sh
endif

ifndef PATCH
	export PATCH = patch
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
