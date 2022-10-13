##! /bin/bash/ -x

isHead=1
isTail=0

headWonTime=0
tailWonTime=0
fixedWonTime=21

tieHeadWonTime=0
tieTailWonTime=0
tieFixedWonTime=2

tieHeadDiff=0
tieTailDiff=0
mainTieHeadDiff=0
mainTieTailDiff=0

count=0

while ((count < 42))
do
	flipCoin=$((RANDOM%2))

	if [[ ($flipCoin -eq $isHead) && ($headWonTime -lt $fixedWonTime) ]]
	then
		((headWonTime++))

	elif [[ ($flipCoin -eq $isTail) && ($tailWonTime -lt $fixedWonTime) ]]
	then
		((tailWonTime++))
	fi
	((count++))
done

echo "Head Won $headWonTime times."
echo "Tail Won $tailWonTime times."

if [ $headWonTime -gt $tailWonTime ]
then
	headDiff=$(($headWonTime - $tailWonTime))
	echo "Head is Won by $headDiff times more than Tail"

elif [ $tailWonTime -gt $headWonTime ]
then
	tailDiff=$(($tailWonTime - $headWonTime))
	echo "Tail is won by $tailDiff times more than Head"

elif [ $headWonTime -eq $tailWonTime ]
then
	echo "Tie :- Both are won 21 times"
	count=0
	while ((count <=10))
	do
		flipCoin=$((RANDOM%2))
		if [[ ($flipCoin -eq $isHead) && ($tieHeadWonTime -ge $mainTaiHeadDiff) ]]
		then
			((tieHeadWonTime++))

		elif [[ ($flipCoin -eq $isTail) && ($tieTailWonTime -ge $mainTaiTailDiff) ]]
		then
			((tieTailWonTime++))

		fi
		((count++))
	done

	echo "tieHead Won $tieHeadWonTime times."
	echo "tieTail Won $tieTailWonTime times."


	if [ $tieHeadWonTime -gt $tieTailWonTime ]
	then
		tieHeadDiff=$(($tieHeadWonTime - $tieTailWonTime))
		echo "tieHead is won by $tieHeadDiff times more than tieTail"

	elif [ $tieTailWonTime -gt $tieHeadWonTime ]
	then
		tieTailDiff=$(($tieTailWonTime - $tieHeadWonTime))
		echo "tieTail is won by $tieTailDiff times more than tieHead"
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

echo "End of file"

