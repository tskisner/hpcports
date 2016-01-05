loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedgnu}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module unload cray-shmem
    module swap gcc gcc/5.2.0
    module swap intel intel/15.0.1.133
    module swap craype craype/2.5.0
    module swap cray-mpich cray-mpich/7.3.0
    module load cray-libsci/13.3.0
    module load git/2.4.6
    module load zlib/1.2.7
    module load curl/7.28.1
    module load bzip2/1.0.6
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    export CRAYPE_LINK_TYPE=dynamic
    export CPATH=/opt/cray/libsci/13.3.0/GNU/51/sandybridge/include:${CPATH}
fi

