#!/bin/bash
chmod a+x *.py *.sh
ls
echo "Would you like to compile and/or run a file too?
Type the file name or *.extension: 
Type nvm to quit without running anything:"
read query

find -maxdepth 1 -name '*.py' -mtime -0.01 >> last_modified
tail -qn 1 last_modified > default
default_file=`tail -c +3 default`

if [ "$query" != "nvm" ]; then
	if [[ "$query" == *".c"* ]]; then
		gcc -Wall -Werror -pedantic -std=gnu89 $query -o executable
		./executable
	elif [[ "$query" == *".py"* ]]; then
		./$query
	elif [ "$query" == "K" ]; then
		query=$default_file
		echo "You are about to run $default_file: "
		./$query
		echo "If that was a python function and it didn't run,
		check if you called that function!"
	fi
fi
