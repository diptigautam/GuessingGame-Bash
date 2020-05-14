#!/usr/bin/env bash
# File: guessinggame.sh

echo "How many files are in the current directory?"

files=$(ls -1Ap | grep -v / | wc -l)
#Uncomment the following to debug/check
# echo $files

function guess {
	read user_input
	while [[ $user_input -ne $files ]]
	do
		if [[ $user_input =~ [[:digit:]] ]]
		then
			if [[ $user_input -gt $files ]]
			then
				echo "Too big guess, try again!"
			else
				echo "Too small guess, try again!"
			fi
		else
			echo "Invalid input, try again!"
		fi
		read user_input
	done
	echo "Perfect, congratulations!"
}

guess
