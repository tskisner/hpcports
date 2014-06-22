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
    module swap gcc gcc/4.9.0
    module swap craype craype/2.1.2
    module swap cray-mpich cray-mpich/7.0.0
    module load cray-libsci cray-libsci/13.0.0
    module load git/1.8.1.4
    module load cmake/2.8.10.2
fi

export CRAYPE_LINK_TYPE=static

