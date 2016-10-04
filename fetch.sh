#!/bin/bash
wget http://projectoadamastor.org/listageral/
for s in $(cat index.html |hxnormalize -x -l 1000|hxselect tbody|hxselect a.wpdm-download-link); do echo $s|grep href; done|cut -d\" -f2 > links
# cleaning up whatever is in the directory already
rm -rf books/*
cd books
for i in $(cat ../links); do wget $i -o /dev/null; done
