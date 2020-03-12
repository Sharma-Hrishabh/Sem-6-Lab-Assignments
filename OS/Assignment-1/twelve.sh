#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Print Sum of digits of number\nUsage: ./twelve number"
    exit
fi


l=${#1}
(( m=0 ))

while [ "$l" -gt -1 ]; do
    d=${1:$l:1}
    (( m+=d ))
    (( l-- ))
done

echo "Sum of digits $m"
