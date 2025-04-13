#!/bin/sh

filename="README-gen.md"

> $filename

echo -e "Collection \n \n" >> $filename

# find . -type d -not -path '*/.*' >> $filename
# echo -e "\n \n"

find "$PWD" -type d -not -path '*/.*' | while read dir; do

	if [ "$dir" != "$PWD" ]; then 
		walls=$(find "$dir" -maxdepth 1 -type f -not -path "*.md" -printf '%P\n')


	if [ ! -z "$walls" ]; then 
		dirfilename="$dir/README.md"

	declare -u string="# $(basename "$dir") collection"
 	echo -e ${string//-/_} > $dirfilename
	echo -e "This folder contains $(basename "$dir") wallpapers \n" >> "$dirfilename"
	
	for wall in $walls; do
		echo "| **$(basename "$wall")** | "  >> $dirfilename
		echo "|------------------------------------------|" >> $dirfilename
		echo "| ![$basename "$wall" ](./$wall) | " >> $dirfilename
		echo -e "\n" >> $dirfilename
	done

	fi

   fi 

done
