#!/bin/sh

DIR=ENCODE_TF_HCT116
encode_txt=$1

mkdir $DIR
cd $DIR

xargs -L 1 curl -O -J -L < ../$encode_txt      ### txt file for HCT116 TFs downloaded from ENCODE
cd ..

mkdir $DIR/names

for file in `find $DIR -type f -name "*.gz"`
do
	gzip -dk $file 
	
	tmp=${file#*\/}
	a=${tmp%\.*\.*}
	
	gene_name=$(awk  -v OFS="\t" -v file_1=$a -F "\t" '{ if ( NR>1 && $1==file_1 ) {print substr($23, 1,length($23)-6)}}' $DIR/metadata.tsv) 

	mv $DIR/$a.bed $DIR/names/$gene_name.bed
	
done
