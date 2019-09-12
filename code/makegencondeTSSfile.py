#fout.write("GeneID\tChr\tStart\tEnd\tStrand\n")


infile=open("/project2/gilad/briana/genome_anotation_data/gencode.v19.annotation.proteincodinggene.bed", "r")
outfile="/project2/gilad/briana/genome_anotation_data/gencode.v19.TSSannotation.SAF"
fout=open(outfile, "w")
fout.write("GeneID\tChr\tStart\tEnd\tStrand\n")

for ln in  infile:
    chr, start, end, gene, score, strand =ln.split()
    chromnew="chr"+chr
    if strand =="+":
        TSSstart=int(start)-1000
        TSSend=int(start)+1000
        fout.write("%s\t%s\t%s\t%s\t%s\n"%(gene, chromnew, TSSstart, TSSend, strand))
    else:
        TSSstart=int(end)-1000
        TSSend=int(end)+1000
        fout.write("%s\t%s\t%s\t%s\t%s\n"%(gene, chromnew, TSSstart, TSSend, strand))
fout.close()
