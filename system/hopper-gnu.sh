loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-pgi PrgEnv-gnu
    module unload pgi
    module unload cray-shmem
    module swap gcc gcc/4.7.2
    module swap xt-asyncpe xt-asyncpe/5.15
    module swap cray-libsci cray-libsci/11.1.01
    module swap cray-mpich2 cray-mpich2/5.5.5
    module load acml/4.4.0
    module load fftw/3.3.0.1
    module load python/2.7.3
fi
