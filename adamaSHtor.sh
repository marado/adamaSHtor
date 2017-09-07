#!/bin/bash

# DEBUG=1

# Fetch the HTML with the list of books
[[ "$DEBUG" ]] && echo "DEBUG: 1";
rm -f index.html # in case we have an older version around
[[ "$DEBUG" ]] && echo "DEBUG: 2";
wget http://projectoadamastor.org/listageral/

[[ "$DEBUG" ]] && echo "DEBUG: 3";
# parse the HTML list
nomes=$(cat index.html|hxnormalize -x -l 1000|hxselect tbody tr td:first-child a -c -s "\n")
[[ "$DEBUG" ]] && echo "DEBUG: 4";
links=$(
	for a in $(
		cat index.html| \
		hxnormalize -x -l 1000| \
		hxselect tbody tr td:nth-child\(4\) -c -s "\n"
	); do
		echo "$a"|grep href|cut -d\" -f2;
	done;
);

[[ "$DEBUG" ]] && echo "DEBUG: 5";
let i=0;
parsed=$(
	echo "$nomes" | while read -r n; do
		let i++;
		l=$(echo "$links"|head -n $i|tail -n 1);
		echo "$l $n";
	done
);

[[ "$DEBUG" ]] && echo "DEBUG: 6";
epubs=$(echo "$parsed"|grep -v MOBI)
mobi=$( echo "$parsed"|grep    MOBI)

# cleaning up whatever is in the directory already
rm -rf books
mkdir books

# fetch the actual books
## epubs...
mkdir books/epubs
cd books/epubs
[[ "$DEBUG" ]] && echo "DEBUG: 7";
echo "$epubs"|while read -r b; do
	link=$(echo "$b"|cut -d" " -f1)
	name=$(echo "$b"|cut -d" " -f2-|cut -d\& -f1)
	wget $link -o /dev/null -O "$name.epub"
done
## ...and mobis
[[ "$DEBUG" ]] && echo "DEBUG: 8";
mkdir ../mobi
cd ../mobi
echo "$mobi"|while read -r b; do
	link=$(echo "$b"|cut -d" " -f1)
	name=$(echo "$b"|cut -d" " -f2-|cut -d\& -f1)
	wget $link -o /dev/null -O "$name.mobi"
done

[[ "$DEBUG" ]] && echo "DEBUG: 9";
