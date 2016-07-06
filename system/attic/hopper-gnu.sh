loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedpgi=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-pgi`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedgnu}" = x ]; then
    if [ "x${loadedpgi}" != x ]; then
      module swap PrgEnv-pgi PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module unload cray-shmem
    module swap gcc gcc/4.9.2
    module swap craype craype/2.2.1
    module swap cray-mpich cray-mpich/7.1.1
    module load cray-libsci/13.0.1
    module load python/2.7.9
    module load zlib/1.2.8
    module load curl/7.35.0
    module load cmake/3.1.3
    module load bzip2/1.0.6
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    export CRAYPE_LINK_TYPE=static
fi
