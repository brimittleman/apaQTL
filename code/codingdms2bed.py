infile=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefseq_coding.dms", "r")
fout=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefseq_coding.bed","w")

for ln in infile:
    chrom, start, end, id, score, strand =ln.split()
    chrom_new=chrom[3:]
    score="."
    fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom,start,end, id, score,strand))
fout.close()
