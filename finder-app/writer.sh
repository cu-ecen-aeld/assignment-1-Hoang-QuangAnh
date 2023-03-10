#!/bin/sh
if [ $# -ne 2 ]; then
	echo "ERROR: Invalud Number of Arguments"
	exit 1
else
	writefile=$1
	writestr=$2
	writedir="$(dirname "$writefile")"
	if [ ! -d $writedir ]; then
		mkdir -p $writedir
	fi
	if [ ! -d ${writefile} ]; then
		echo ${writestr} > ${writefile}
		if [ ! -f ${writefile} ]; then
			echo "ERROR: Failed to write to file"
			exit 1
		fi
	fi
fi
