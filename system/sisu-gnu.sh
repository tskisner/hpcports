loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
if [ "x${loaded}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module swap gcc gcc/5.3.0
    module swap craype craype/2.5.4
    module swap cray-mpich cray-mpich/7.3.3
    module load cray-libsci cray-libsci/16.03.1
    module load git/2.1.0
    module load cmake/3.2.3
    module swap craype-haswell craype-sandybridge
fi

export CRAYPE_LINK_TYPE=dynamic
