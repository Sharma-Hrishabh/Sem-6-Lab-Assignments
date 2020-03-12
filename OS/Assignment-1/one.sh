#!/bin/bash


if [ $# -lt 1 ];
then
  echo "Usage: ./one <character>"
  exit
fi

case $1 in 
    [aeiouAEIOU])
        echo "Vowel"
        ;;
    [A-Z])
        echo "Uppercase"
        ;;
    [a-z])
        echo "Lowercase"
        ;;
    [0-9])
        echo "Digit"
        ;;
esac
    
