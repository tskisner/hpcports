loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-cray PrgEnv-gnu
    module unload cray-shmem
    module swap gcc gcc/4.7.3
    module swap craype craype/1.05
    module swap cray-mpich2 cray-mpich2/5.6.5
    module load git/1.8.1.4
fi
