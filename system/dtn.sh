ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.9.2" ]; then
    module load gnu-base/gcc492_bin224_C6
fi
