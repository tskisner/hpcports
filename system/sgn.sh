ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.8.2" ]; then
    module load gcc-tsk/4.8.2_rh5
fi
