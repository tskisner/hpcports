ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.9.0" ]; then
    module unload pgi
    module unload openmpi
    module load gcc/4.7.0
    module load mkl/13.0.1
    module load openmpi-gnu/1.4.5
    module load gnu-base/gcc470_carver
    module load git/1.7.8.3
fi
