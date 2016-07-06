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
    module swap craype craype/2.2.1
    module unload cray-shmem
    module unload cray-mpich
    module unload atp
    module unload cray-libsci
    module swap gcc gcc/4.9.2
    module load zlib/1.2.8
    module load curl/7.35.0
    module load bzip2/1.0.6
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    module load ccm
fi

export CRAYPE_LINK_TYPE=dynamic
