#!/bin/sh

filename="README.md"

echo -e "_all of my personal walls in one repo. ✨_ \n" > $filename
echo "#### Contents" >> $filename

find "$PWD" -type d -not -path '*/.*' | while read dir; do

	echo -e "- [$(basename "$dir") collection]($(basename "$dir")/README.md)" >> $filename
	
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

echo -e "\n #### Resources\ncheck out these websites where i find my wallpapers.\n - [r/unixporn](https://www.reddit.com/r/unixporn/) \n - [uhdpaper](https://www.uhdpaper.com/) \n - [alphacoders](https://alphacoders.com/) \n - [wallpaper flare](https://www.wallpaperflare.com/) \n - [pinterest](https://in.pinterest.com/) \n - [wallhaven.cc](https://wallhaven.cc/)" >> $filename
