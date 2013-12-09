ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.7.1" ]; then
    module load gcc/47
fi
