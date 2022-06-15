from Bio import SeqIO
import regex
import time
import sys

fa_genome= sys.argv[1]                                    ### genome location

pattern=r'[GC]g[GC][GC][GC]'                    ### regexp for patern to find
print (pattern)

f_out = open('hg38_SGSS.bedgraph', 'w')         ### output file name

FA_all = SeqIO.parse(open(fa_genome),'fasta')

all_start_time=time.time()
for FA in FA_all:

    name= FA.id
    chr_start_time = time.time()

## plus sttand
    res=regex.finditer(pattern, str(FA.seq) , flags=regex.IGNORECASE, overlapped=True)

    for m in res:
        f_out.write(name+"\t"+str(m.start())+"\t"+str(m.end())+"\t+1\n")   
## minus strand
    res=regex.finditer(pattern, str(FA.seq.reverse_complement()) , flags=regex.IGNORECASE, overlapped=True)

    for m in res:
        f_out.write(name+"\t"+str(len(FA.seq)-m.end())+"\t"+str(len(FA.seq)-m.start())+"\t-1\n")   
   
    print (name,"finished in ", (time.time()-chr_start_time)/60, "min")
    print("Total time:",(time.time()-all_start_time)/60, "min") 
						
f_out.close()					

		
