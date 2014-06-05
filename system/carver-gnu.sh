ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.9.0" ]; then
    module unload pgi
    module unload openmpi
    module load gnu-base/gcc490_bin224
    module load mkl/13.0.1
    module load git/1.7.8.3
fi
