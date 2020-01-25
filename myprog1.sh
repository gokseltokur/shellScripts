#!/bin/bash
clear

# Read whole arguments
args=$*
str=${args,,}
length=$((${#str}))
# echo $length

q=$(( ($length / 2) ))
boo=0
# If there is no argument give an error.
if (( length > 0 ))
then
    for ((i=0; i<q; i++));
    do
        if [[ ${str:i:1} != ${str:length-1-i:1} ]]
        then
            boo=1
        fi
    done

    if [[ $boo == 1 ]]
    then
        echo "$str is not a palindrome"
    else
        echo "$str is a palindrome"
    fi
else
    echo "You need to put at least one character."
fi
