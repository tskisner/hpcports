export CRAY_ROOTFS=DSL

loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-pgi PrgEnv-gnu
    module unload pgi
    module unload cray-shmem
    module swap gcc gcc/4.7.2
    module swap xt-asyncpe xt-asyncpe/5.16
    module unload cray-mpich2
    module load acml/5.1.0
    module load ccm
    module load openmpi-ccm/1.6.3
fi