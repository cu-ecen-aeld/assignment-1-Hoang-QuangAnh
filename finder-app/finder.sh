#!/bin/sh
if [ ! $# -eq 2 ]; then
	echo "ERROR: Invalid Number of Arguments"
	exit 1
else
	filesdir=$1
	searchstr=$2
	if [ ! -d $filesdir ]; then
		echo "ERROR: Invalid directory"
		exit 1
	else
		numlines=0
		numfiles=0
		for file in $(find $filesdir -type f)
		do
			curr_line=$(cat $file | grep $searchstr | wc -l)
			if [ $curr_line -gt 0 ]; then
				numlines=$((numlines + curr_line))
				numfiles=$((numfiles + 1))
			fi
		done
		echo "The number of files are $numfiles and the number of matching lines are $numlines"
		exit 0
	fi
fi
