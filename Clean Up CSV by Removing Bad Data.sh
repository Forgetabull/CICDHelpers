#!/bin/bash

echo "-------------------------------------------------------------"
echo "$0 Processing $1"
echo "-------------------------------------------------------------"
echo " "

FILES="$1/*.csv"
for f in $FILES
do
    now=$(date +"%T")
    echo "[$now] Processing $f..."

    sed -i 's/,Error/,/' $f
    sed -i 's/,I\/O Timeout/,/' $f
    sed -i 's/,Bad/,/' $f
    sed -i 's/,Scann Off/,/' $f
    sed -i 's/,Scan Off/,/' $f
    sed -i 's/,Comm Fail/,/' $f
    sed -i 's/,Configure/,/' $f

done 

echo "Done."
