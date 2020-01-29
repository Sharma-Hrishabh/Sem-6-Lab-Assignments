#!/bin/sh


read -p "Type a character" c

case $c in
	[A-Z] )
		echo "Uppercase Letter"
		;;
	[a-z] )
		echo "LowerCase Letter"
		break
		;;
	[0-9] )
		echo "a Digit"
		break
		;;
	*)
		echo "special symbol"
		;;
  esac