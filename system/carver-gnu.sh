loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep openmpi-gnu`
if [ "x${loaded}" = x ]; then
    module unload pgi
    module load gcc/4.7.0
    module unload openmpi
    module load openmpi-gnu/1.4.5
    module load mkl/10.2
    module load git/1.7.8.3
fi
