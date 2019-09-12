#fix order for grouped file:


infile=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/AllTranscriptsbyName.Grouped.bed", "r")
fout=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/FullTranscriptByName.bed","w")

for ln in infile:
    chrom, gene, strand, start, end =ln.split()
    score="."
    fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom, start, end, gene, score, strand))
fout.close()
