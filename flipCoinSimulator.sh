#! /bin/bash/ -x

flipCoin=$((RANDOM%2))

isHead=1

if [ $flipCoin -eq $isHead ]
then
	echo "Head is Winner"

else
	echo "Tail is Winner"
fi
