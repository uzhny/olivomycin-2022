# olivomycin-2022

OLIVO-parser_DK.py

python script to parse all stites in hg38 with regexp patern '[GC]g[GC][GC][GC]' 
comments: case nonsesitive, overlapped, both strands

run: python OLIVO-parser_DK.py gomome\fasta\location
result: file hg38_SGSS.bedgraph ~882Mb


ENCODE_download.sh

shell script to bach download TF tracks form ENCODE  "ENCODE_TF_HCT116.txt"

run: ./ENCODE_download.sh ENCODE_TF_HCT116.txt
result: directiry .\ENCODE_TF_HCT116\names\ with TFs bedfiles with TF name


analys.sh

shell script to create tabe of coverage regions in 10genes_TSS.bed with TF region from .\ENCODE_TF_HCT116\names\ directory

run: ./analys.sh >output.txt
result: output.txt table with header "Gene	TF	pos	cover	index"


drawing.R

R script to draw a picture of coverage TF by TSS regions or otherwise

result: Figure S2 
