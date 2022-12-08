#!/bin/bash

echo "Here is a list of files you should stage: "
git status
echo "Which file would you like to stage at this time: 
Type nvm to quit: "
find -maxdepth 1 -name '*.py' -mtime -0.01 >> last_modified
tail -qn 1 last_modified > default
default_file=`tail -c +3 default` 


echo "The default file is: $default_file"
read file_name
if [ "$file_name" != "nvm" ]; then
	if [ "$file_name" == "K" ]; then
		file_name=$default_file
	fi
	git add $file_name
	echo "Type a brief commit message about: $file_name"
	read commit_message
	git commit -m "$commit_message"
fi
