#!/bin/bash

mkdir books/epub;
epubs=$(file books/*|grep EPUB|cut -d: -f1);
for e in $(echo $epubs); do
	mv "$e" "books/epub/$(echo $e|cut -d= -f2).epub";
done

mkdir books/mobi;
file books/*|grep Mobipocket|while read -r line; do
	file=$(echo "$line"|cut -d: -f1);
	name=$(echo "$line"|cut -d\" -f2);
	mv "$file" "books/mobi/$name.mobi";
done
