#!/bin/bash -x
randomFlip=$((RANDOM%2))
if [ $randomFlip -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi


declare -A SingletDict

heads=0
tails=0

for ((count=0; count<20; count++))
do
	result=$((RANDOM % 2))
	if [ $result -eq 1 ]
	then
		$((heads++))
	else
		$((tails++))
	fi
done

SingletDict[Head]=$heads
SingletDict[Tail]=$tails

for i in ${!SingletDict[@]}
do
	percentResult=$((${SingletDict[$i]} * 100 / 20))
	echo $i" percentage: "$percentResult
done

declare -A DoubleDice
declare -A PercentDouble
hh=0
ht=0
th=0
tt=0

for ((count=0; count<20; count++))
do
	result=$((RANDOM % 4))
	if [ $result -eq 0 ]
	then
		$((hh++))
	elif [ $result -eq 1 ]
	then
		$((ht++))
	elif [ $result -eq 2 ]
	then
		$((th++))
	elif [ $result -eq 3 ]
	then
		$((tt++))
	fi
done

DoubleDict[HH]=$hh
DoubleDict[TT]=$tt
DoubleDict[HT]=$ht
DoubleDict[TH]=$th

for i in ${!DoubleDict[@]}
do
	PercentDouble[$i]=$((${DoubleDict[$i]} * 100 / 20))
done
echo ${PercentDouble[@]}
