loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module swap PrgEnv-cray PrgEnv-gnu
    module unload cray-shmem
    module swap gcc gcc/4.8.1
    module swap craype craype/1.06
    module swap cray-mpich cray-mpich/6.0.2
    module load git/1.8.1.4
    module load cmake/2.8.10.2
fi
