#!/bin/sh

#!/bin/sh

echo "Please \n 1:Number of users logged in.\n 2:Print calendar of current year. \n 3:Print the date.\n"
while :
do
read c

case $c in
	1)
		
		echo users | wc -w
		;;
	2)
		cal -y
		;;
	3)
		cal -j
		;;
	*)
		echo "WRONG CHOICE"
		break
		;;
  esac
  done