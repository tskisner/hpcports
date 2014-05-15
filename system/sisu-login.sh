loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
if [ "x${loaded}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module swap craype craype/2.1.0
    module unload cray-shmem
    module unload cray-mpich
    module unload atp
    module unload cray-libsci
    module unload craype-network-aries
    module load craype-network-none
    module swap gcc gcc/4.8.2
    module load git/1.8.1.4
    module load cmake/2.8.10.2
fi

export CRAYPE_LINK_TYPE=dynamic

