#!/bin/bash

read -p "Give Input" c

if [ -e $c ] ;then
    if [ -d $c ] ; then
        echo $c is a directory
    elif [ -f $c ] ; then
        echo $c is a file
    else
        echo $c is neither a file nor a directory
    fi
fi