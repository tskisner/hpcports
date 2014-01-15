loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedintel}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-intel
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-gnu PrgEnv-intel
    fi
    module unload cray-shmem
    module swap intel intel/14.0.0.080
    module swap craype craype/2.03
    module swap cray-mpich cray-mpich/6.2.0
    module load cray-libsci/12.1.3
    module load mkl/13.0.3
    module load git/1.8.1.1
    module load python/2.7.5
    module load zlib/1.2.7
    module load curl/7.28.1
    module load cmake/2.8.11.2
    module load bzip2/1.0.6
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    export CRAYPE_LINK_TYPE=static
fi
