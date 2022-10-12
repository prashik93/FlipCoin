#! /bin/bash/ -x

isHead=1

headCount=0
tailCount=0

count=0
while (( count < 10 ))
do
	flipCoin=$((RANDOM%2))

	if [ $flipCoin -eq $isHead ]
	then
		echo "Head is Winner"
		((headCount++))
	else
		echo "Tail is Winner"
		((tailCount++))
	fi
	((count++))
done

echo "Head Won $headCount times."
echo "Tail Won $tailCount times."
