# setup the HPCPorts environment

# what shell is this?

THISSHELL=`echo $SHELL | sed -e 's/.*\/\(.*\)$/\1/'`

# first off, the modules version on riemann is broken for many module files which
# load dependencies.  switch to 3.2.10.

export MODULE_VERSION="3.2.10"
if [ -r /clusterfs/riemann/data/kisner/software/Modules/${MODULE_VERSION}/init/${THISSHELL} ]; then
    source /clusterfs/riemann/data/kisner/software/Modules/${MODULE_VERSION}/init/${THISSHELL}
else
    source /clusterfs/riemann/data/kisner/software/Modules/${MODULE_VERSION}/init/sh
fi

# now append the modulefile paths to the GCC that we are using and the HPCPorts install

module use /clusterfs/riemann/data/kisner/software/modulefiles
module use /clusterfs/riemann/data/kisner/software/hpcports/env/modulefiles

