##! /bin/bash/ -x

isHead=1
isTail=0

headWonTime=0
tailWonTime=0
fixedWonTime=21

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

fi
