#!/bin/bash -x
echo "---Welcome to Snake Ladder Game---"

#Constants declaration
START_POSITION=0
END_POSITION=100

#Variables declaration
currentPosition=0

#Rolling the die ton get number between  1 to 6.
dieRoll=$((RANDOM%6+1))
