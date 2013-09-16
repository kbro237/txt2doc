#!/bin/bash
#
# This script processes all txt files given as arguments thru
# [multimarkdown](http://fletcherpenney.net/multimarkdown/) and converts
# the output to a .docx file in the same directory.
#
# Example: a folder is full of txt newsletter articles that I've written,
# but now I have to give them to someone else...

for file in "$@"
do
	if [[ "$file" != *.txt ]]
	then
		echo "Arguments must be *.txt files!"
		exit
	fi

    multimarkdown "$file" | textutil -format html -convert docx -output "`basename "$file" | sed 's/\.txt//'`.docx" -stdin
done

exit
