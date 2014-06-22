#!/bin/bash


PROLOG="<html><head><link type='text/css' rel='stylesheet' href='imgs.css' title='CSS stylesheet' /></head><body>"

TRAIL="</body></html>"


cd /vagrant/citedownmgr
gradle -Pconf=../hmt-12F/writing/cdmgr.conf flatmd


cd /vagrant/hmt-12F/converted

shopt -s nullglob
for f in *.md
do
    extension="${f##*.}"
    filename="${f%.*}"
    pandoc -o tmp.html ${f}
    HTML=`cat tmp.html`
    echo $PROLOG $HTML $TRAIL > ${filename}.html

    #echo "Process ${f}, ${filename}, ${extension}"
done


