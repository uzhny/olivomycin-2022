#!/bin/sh

awk 'BEGIN{print "Gene\tTF\tpos\tcover\tindex"}'										 ### Print table header


DIR='./ENCODE_TF_HCT116/names/'						 									 ### ENCODE TF binging sites bedfiles location 

L=2500                                                                                   ### L - extentoin distance +- from TSS
awk -v OFS="\t" -v le=$L '{print $1, $2-le, $3+le, $4, $5, $6}' 10genes_TSS.bed >1.bed   ### 10genes_TSS.bed - TSS site of genes
																						 ### 1.bed temprory file with exnended region
for file in `find $DIR -type f -name "*.bed"`
do	
bedtools coverage -d -a 1.bed -b $file | awk -v name=$file -v le=$L '{if ($6=="-"){print $4, "\t", substr(name,46, length(name)-46-3), (le-$7), $8, $5} else {print $4, "\t", substr(name,46,length(name)-46-3), (-le+$7), $8, $5}}'
done

rm 1.bed