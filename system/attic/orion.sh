loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep acml`
if [ "x${loaded}" = x ]; then
    module load acml/4.4.0
fi
