#!/bin/bash
#
# Simple script to build all products at once

for i in carbonio carbonio-ce suite ; do
    # use clean html to wipe out the old build and write a fresh one
    make -C source/$i html
done

echo""
echo "Script finished"
