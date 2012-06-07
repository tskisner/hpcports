
# various system tool defaults

ifndef MAKE
	export MAKE = make
endif

ifndef SHELL
	export SHELL = /bin/sh
endif

ifndef UNGZIP
	export UNGZIP = gunzip <
endif

ifndef GZIP
	export GZIP = | gzip -9 >
endif

ifndef UNBZIP
	export UNBZIP = bunzip2 <
endif

ifndef BZIP
	export BZIP = | bzip2 -9 >
endif

ifndef XTAR
	export XTAR = | tar xvf -
endif

ifndef CTAR
	export CTAR = tar cvf -
endif
