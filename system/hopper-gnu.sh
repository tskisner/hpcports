loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-pgi PrgEnv-gnu
    module unload pgi
    module unload cray-shmem
    module swap gcc gcc/4.7.2
    module swap xt-asyncpe xt-asyncpe/5.23
    module swap cray-libsci cray-libsci/12.0.00
    module swap cray-mpich2 cray-mpich2/5.6.4
    module load acml/4.4.0
    module load fftw/3.3.0.2
    module load python/2.7.3
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    module load darshan/2.2.6
fi
