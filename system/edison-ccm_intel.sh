loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedintel}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-intel
    fi
    if [ "x${loadedgnu}" != x ]; then
      module swap PrgEnv-gnu PrgEnv-intel
    fi
    module unload cray-shmem
    module swap craype craype/2.03
    module swap intel intel/14.0.0.080
    module load mkl/13.0.3
    module load git/1.8.1.1
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    module load ccm
    module load craype-target-native
fi
