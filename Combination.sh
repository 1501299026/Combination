#!/bin/bash -x
randomFlip=$((RANDOM%2))
if [ $randomFlip -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi

