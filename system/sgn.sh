ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.9.0" ]; then
    module load gnu-base/gcc490_bin224
fi
