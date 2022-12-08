#!/bin/bash
echo "What is the name of the file you would like to create:
Do not add the .py extension!"
read file_name
echo "#!/usr/bin/python3" > $file_name.py
vim $file_name.py
chmod a+x $file_name.py
echo "Would you like to run the file $file_name.py you just created:
Type y to run any other key to skip: "
read query
if [ "$query" == "y" ]; then
	./$file_name.py
	echo "Did it run correctly? Would you like to stage and commit? "
	read response
	if [ "$response" == "y" ]; then
		git add $file_name.py
		echo "Type your commit message for $file_name.py: "
		read commit_message
		echo "You are about to commit with the message	$commit_message"
		read assert
		if [ "$assert" == "y" ]; then
			git commit -m "$commit_message"
		fi
		echo "You might have not adhered to PEP8 regulations, \
			If no messages follow this message, all is good\
			Would you like to rectify PEP8 'offenses', if they exist?"		
		pycodestyle $file_name.py
		echo "Rectify: "
		read req
		if [ "$req" == "y" ]; then
			vim $file_name.py
			pycodestyle $file_name.py
			echo "Done? "
			read assert2
			if [ "$assert2" == "y" ]; then
				git add $file_name.py
				git commit -m "Rectified coding style, PEP8"
			fi
		fi
	fi
fi
