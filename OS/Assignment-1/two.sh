#!/bin/bash

if [ $# lt 1 ];
then
  echo -e "Usage: ./two option\n\t1 : Show number of users logged in\n\t2 : Print calendar for current year\n\t3 : Print the date"
  exit
fi


case $1 in
    1)
    u=$(users | wc -w)
    echo "count of users logged in is $u "
    ;;
    2)
    y=$(date +%y)
    cal $y
    ;;
esac 
