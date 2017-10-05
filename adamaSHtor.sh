#!/bin/bash

# DEBUG=1

# Check dependencies (wget, html2text, HTML-XML-utils)
type wget &>/dev/null        || { echo "wget is not installed, aborting."; exit 1; }
type html2text &>/dev/null   || { echo "html2text is not installed, aborting."; exit 1; }
type hxnormalize &>/dev/null || { echo "HTML-XML-utils is not installed, aborting."; exit 1; }

# Fetch the HTML with the list of books
[[ "$DEBUG" ]] && echo "DEBUG: starting";
rm -f index.html # in case we have an older version around
[[ "$DEBUG" ]] && echo "DEBUG: fetching catalog";
wget -o /dev/null http://projectoadamastor.org/catalogo/

[[ "$DEBUG" ]] && echo "DEBUG: fetching book pages";
# parse the HTML list
bookpages=$(for i in $(grep prod-cat-mid-div- index.html); do echo $i|grep href; done|cut -d\' -f2)

rm -rf bookpages;
mkdir bookpages;
cd bookpages;
for i in $bookpages; do wget -o /dev/null $i; done
cd ..
# cleaning up whatever is in the directory already
rm -rf books
mkdir books
mkdir books/epubs
mkdir books/mobi
	
for p in bookpages/*; do
	[[ "$DEBUG" ]] && echo "DEBUG: parsing $p";
	title=$(grep Título: $p|cut -d\> -f4|cut -d \< -f1);
	title=$(cat $p|hxnormalize -x -l 1000|hxselect title -c|sed 's/—/;/'|cut -d\; -f1|sed 's/&#8211$//'|html2text -utf8);
	epub=$(grep data-durl $p|grep -v mobi|cut -d\" -f4);
	mobi=$(grep data-durl $p|grep    mobi|cut -d\" -f4);
	[[ "$DEBUG" ]] && echo "DEBUG:" && echo " * Titulo: $title" && echo " * epub:    $epub" && echo " * mobi:    $mobi";

	# fetch the actual books
	[[ "$DEBUG" ]] && echo "DEBUG: fetching epub"
	wget $epub -o /dev/null -O "books/epubs/$title.epub"
	[[ "$DEBUG" ]] && echo "DEBUG: fetching mobi"
	wget $mobi -o /dev/null -O "books/mobi/$title.mobi"
done

rm -rf bookpages
