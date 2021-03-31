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

declare -A DoubleDice
declare -A PercentDouble
hhh=0
hth=0
thh=0
hht=0
ttt=0
tth=0
tht=0
htt=0
for ((count=0; count<20; count++))
do
	result=$((RANDOM % 8))
	if [ $result -eq 0 ]
	then
		hhh=$(($hhh+1))
	elif [ $result -eq 1 ]
	then
		hth=$(($hth+1))
	elif [ $result -eq 2 ]
	then
		thh=$(($thh+1))
	elif [ $result -eq 3 ]
	then
		hht=$(($hht+1))
	elif [ $result -eq 4 ]
   then
      ttt=$(($ttt+1))
	 elif [ $result -eq 5 ]
   then
      tth=$(($tth+1))
	 elif [ $result -eq 6 ]
   then
      tht=$(($tht+1))
	 elif [ $result -eq 7 ]
   then
      htt=$(($htt+1))
	fi
done

DoubleDict[HHH]=$hhh
DoubleDict[TTT]=$ttt
DoubleDict[HTH]=$hth
DoubleDict[THH]=$thh
DoubleDict[HHT]=$hht
DoubleDict[TTH]=$tth
DoubleDict[THT]=$tht
DoubleDict[HTT]=$htt



for i in ${!DoubleDict[@]};
do
	PercentDouble[$i]=$((${DoubleDict[$i]} * 100 / 20))
	echo $i" percentage: "${DoubleDict[$i]}
done
echo ${PercentDouble[@]}
declare -A CoinDict

CoinDict[H]=0
CoinDict[T]=0
CoinDict[HT]=0
CoinDict[TH]=0
CoinDict[HH]=0
CoinDict[TT]=0
CoinDict[HHH]=0
CoinDict[TTT]=0
CoinDict[HTT]=0
CoinDict[TTH]=0
CoinDict[THT]=0
CoinDict[HTH]=0
CoinDict[HHT]=0
CoinDict[TTH]=0

for ((count=0; count<60; count++))
do
	TossChoice=$((RANDOM%3 + 1))
	case $TossChoice in
	1)
		singleToss=$((RANDOM % 2))
		case $singleToss in
		0)
			$((CoinDict[H]++))
			;;
		1)
			$((CoinDict[T]++))
			;;
		esac
		;;
	2)
		coupleToss=$((RANDOM % 4))
		case $coupleToss in
		0)
			$((CoinDict[HH]++))
			;;
		1)
			$((CoinDict[HT]++))
			;;
		2)
			$((CoinDict[TH]++))
			;;
		3)
			$((CoinDict[TT]++))
			;;
		esac
		;;
	3)
		tripleToss=$((RANDOM%8))
		case $tripleToss in
		0)
			$((CoinDict[HHH]++))
			;;
		1)
			$((CoinDict[HHT]++))
			;;
		2)
			$((CoinDict[THH]++))
			;;
		3)
			$((CoinDict[HTH]++))
			;;
		4)
			$((CoinDict[TTT]++))
			;;
		5)
			$((CoinDict[TTH]++))
			;;
		6)
			$((CoinDict[HTT]++))
			;;
		7)
			$((CoinDict[THT]++))
			;;
		esac
		;;
	esac
done

echo ${CoinDict[@]}
echo ${!CoinDict[@]}

winCombination=`printf "%s\n" ${CoinDict[@]} | sort -nr | head -1`
echo $winCombination

for i in ${!CoinDict[@]}
do
	if [ ${CoinDict[${i}]} -eq $winCombination ]
	then
		echo "Winning Combination is "$i
	fi
done
