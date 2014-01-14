#!/bin/bash

for f in `ls *.dot`; do 
    dot -Tpng -O $f
done

