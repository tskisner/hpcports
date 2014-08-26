ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.8.3" ]; then
    module unload pgi
    module unload openmpi
    module load gcc/4.8.3
    module load mkl/14.0.2
    module load openmpi-gcc/1.8.1
fi
