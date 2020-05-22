#!/usr/bin/env bash
# File: guessinggame.sh

function invalid {
	while [[ $user_input =~ [^0-9] ]]
	do
		echo "Invalid input, try again!"
		read user_input
	done
}

function guess {
	while [[ $user_input -ne $files ]]
	do
		if [[ $user_input -gt $files ]]
		then
			echo "Too big guess, try again!"
		else
			echo "Too small guess, try again!"
		fi
		read user_input
		invalid
	done
	echo "Perfect, congratulations!"
}

function guessing_game {
	echo "How many files are in the current directory?"

	read user_input

	files=$(ls -1Ap | grep -v / | wc -l)
	#Uncomment the following to debug/check
	# echo $files

	invalid
	guess
}

guessing_game
