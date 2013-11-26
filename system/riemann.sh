ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.8.2" ]; then
    module load gcc/4.8.2
    module load mkl/11.0.084
fi
