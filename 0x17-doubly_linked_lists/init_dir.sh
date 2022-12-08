#!/bin/bash
echo "Name the directory, you are about to create: "
read dir_name
mkdir $dir_name
echo "# - $dir_name" > ./$dir_name/README.md
cp *.sh ./$dir_name
cd $dir_name
git add .
git commit -m "Initialize directory"
