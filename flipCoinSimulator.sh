#! /bin/bash/ -x

isHead=1
isTail=0

headWonTime=21
tailWonTime=21
fixedWonTime=21

tieHeadWonTime=0
tieTailWonTime=0
tieFixedWonTime=2

tieHeadDiff=0
tieTailDiff=0
mainTieHeadDiff=0
mainTieTailDiff=0

while [[ (($headWonTime -lt $fixedWonTime) && ($tailWonTime -lt $fixedWonTime)) ]]
do
	flipCoin=$((RANDOM%2))

	if [ $flipCoin -eq $isHead ]
	then
		((headWonTime++))

	elif [ $flipCoin -eq $isTail ]
	then
		((tailWonTime++))
	fi
done


if [ $headWonTime -gt $tailWonTime ]
then
	headDiff=$(($headWonTime - $tailWonTime))
	echo "Head is Won by $headDiff times more than Tail"

elif [ $tailWonTime -gt $headWonTime ]
then
	tailDiff=$(($tailWonTime - $headWonTime))
	echo "Tail is Won by $tailDiff times more than Head"

elif [ $headWonTime -eq $tailWonTime ]
then
	count=0
	while ((count <=10))
	do
		flipCoin=$((RANDOM%2))
		if [ $flipCoin -eq $isHead ]
		then
			((tieHeadWonTime++))

		elif [ $flipCoin -eq $isTail ]
		then
			((tieTailWonTime++))

		fi
		((count++))
	done
	echo "tieHead Won $tieHeadWonTime"
	echo "tieTail Won $tieTailWonTime"
	if [ $tieHeadWonTime -gt $tieTailWonTime ]
	then
		tieHeadDiff=$(($tieHeadWonTime - $tieTailWonTime))

	elif [ $tieTailWonTime -gt $tieHeadWonTime ]
	then
		tieTailDiff=$(($tieTailWonTime - $tieHeadWonTime))
	fi

	if [ $tieHeadDiff -gt $tieTailDiff ]
	then
		mainTieHeadDiff=$(($tieHeadDiff - $tieTailDiff))
		if [ $mainTieHeadDiff -ge $tieFixedWonTime ]
		then
			echo "Main Tai Head Diff is $mainTieHeadDiff"
			echo "Head is Won by $mainTieHeadDiff times more than Tail"
		fi

	elif [ $tieTailDiff -gt $tieHeadDiff ]
	then
		mainTieTailDiff=$(($tieTailDiff - $tieHeadDiff))
		if [ $mainTieTailDiff -ge $tieFixedWonTime ]
		then
			echo "Main Tai Tail Diff is $mainTieTailDiff"
			echo "Tail is Won by $mainTieTailDiff times more than Head"

		fi
	fi
fi
