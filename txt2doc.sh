#!/bin/bash
# This script process all txt files in a directory thru mmd and converts the
# output to a Word Document in the same directory example: a folder is full of
# txt newsletter articles that I've written, but now I have to give them to
# someone else...

for file in *.txt
do
    multimarkdown "$file" | textutil -format html -convert docx -output "`basename "$file" | sed 's/\.txt//'`.docx" -stdin
done

exit
