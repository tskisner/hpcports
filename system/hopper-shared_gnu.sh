loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedpgi=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-pgi`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedgnu}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedpgi}" != x ]; then
      module swap PrgEnv-pgi PrgEnv-gnu
    fi
    module unload cray-shmem
    module swap gcc gcc/4.8.2
    module swap cray-mpich cray-mpich/6.0.1
    module load cray-libsci/12.1.01
    module load git/1.7.7.4
    module load zlib/1.2.7
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    export XTPE_LINK_TYPE=dynamic
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/alps
fi
