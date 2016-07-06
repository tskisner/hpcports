loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-pgi PrgEnv-gnu
    module unload pgi
    module swap gcc gcc/4.5.2
    module load acml/4.4.0
    module unload xt-shmem
    module load fftw/3.2.2.1
    module load git/1.7.7.2
fi
