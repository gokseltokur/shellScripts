#!/bin/bash
clear

outer=$1
inner=$2
echo $outer

subio=$(($outer-$inner))
subio2=$((($outer-$inner)/2))

# If first input is not greater than and difference is not even give an error.
if (( (outer > inner) && (subio%2 == 0) ))
then
    for ((i=0; i<outer; i++));
    do
        for ((j=0; j<outer ; j++));
        do
            sumij=$(($i+$j))
            if (( ($i < $subio2 || $i>$(($outer-$subio2-1))) || ( $j<$subio2 || j>$(($outer-$subio2-1))) ))
            then
                printf "*"
            else
                printf " "
            fi
        done
        printf "\n"
    done
else
    echo "Invalid Arguments - First argument must be greater than second one and difference between the two arguments must be even"
fi