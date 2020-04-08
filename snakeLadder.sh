#!/bin/bash -x
echo "---Welcome to Snake Ladder Game---"

#Constants declaration
START_POSITION=0
END_POSITION=100
PLAY=0
SNAKE=1
NOPLAY=2

#Variables declaration
currentPosition=0

#Execution start from here

while [[ $currentPosition -ne $END_POSITION ]]
do
   rollToPlay=$((RANDOM%3))

case $rollToPlay in
	$PLAY)
		dieRoll=$(($((RANDOM%6))+1))
		currentPosition=$((currentPosition+dieRoll))
		;;

	$SNAKE)
		dieRoll=$(($((RANDOM%6))+1))
		if [[ $currentPosition -eq 0 || $currentPosition -lt $dieRoll ]]
			then
				currentPosition=$currentPosition;
		else
				currentPosition=$((currentPosition-dieroll))
		fi
		;;
	$NOPLAY)
		currentPosition=$((currentPosition+0))
		;;
esac
done
