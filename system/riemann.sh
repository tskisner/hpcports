ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.8.2" ]; then
    export PATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/bin:$PATH
    export CPATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/include:$CPATH
    export LIBRARY_PATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/lib64:$LIBRARY_PATH
    export LIBRARY_PATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/lib64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/clusterfs/riemann/data/kisner/software/gcc-4.8.2/lib:$LD_LIBRARY_PATH

    module load mkl/11.0.084
fi
