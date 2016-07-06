loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module unload pgi
    module swap PrgEnv-pgi PrgEnv-gnu
    module unload gcc
    module load acml/4.4.0
    module unload xt-shmem
    module load fftw/3.3.0.0
fi
