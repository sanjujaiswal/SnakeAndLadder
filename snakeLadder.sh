#!/bin/bash
echo "---Welcome to Snake Ladder Game---"

#Constants declaration
START_POSITION=0
END_POSITION=100
PLAY=0
SNAKE=1
NOPLAY=2

#Variables declaration
currentPosition=0
numberOfTimes=1
winTimes=0

#Array declaration to store win position
declare -a arrayPosition

function diePosition(){
		arrayPosition[$numberOfTimes]=$1;
		((numberOfTimes++))
}

#Program's execution start from here
while [[ $currentPosition -ne $END_POSITION ]]
do
		rollToPlay=$((RANDOM%3))

case $rollToPlay in
	$PLAY)
		dieRoll=$(($((RANDOM%6))+1))

		if [[ $((END_POSITION-currentPosition)) -eq $dieRoll ]]
		then
			diePosition $currentPosition
			currentPosition=$((currentPosition+dieRoll))
			((winTimes++))

		elif [[ $((END_POSITION-currentPosition)) -lt $dieRoll ]]
		then
			diePosition $currentPosition
			currentPosition=$currentPosition
			((winTimes++))
		else
			diePosition $currentPosition
			currentPosition=$((currentPosition+dieRoll))
			((winTimes++))
		fi
		;;
	$SNAKE)
		dieRoll=$(($((RANDOM%6))+1))

		if [[ $currentPosition -eq 0 || $currentPosition -lt $dieRoll ]]
		then
			diePosition $currentPosition
			currentPosition=$currentPosition;

		else
			diePosition $currentPosition
			currentPosition=$((currentPosition-dieRoll))
		fi
		;;
	$NOPLAY)
		diePosition $currentPosition
		currentPosition=$((currentPosition+0))
		;;
	esac
done

echo "Number of times win is :$winTimes"
