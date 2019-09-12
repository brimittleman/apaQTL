infile=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/Transcript2GeneName.dms", "r")
fout=open("/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/AllTranscriptsbyName.bed", "w")

for i, ln in enumerate(infile):
    if i>0:
        gene=ln.split()[12]
        chrom=ln.split()[2]
        start=ln.split()[4]
        end=ln.split()[5]
        score=ln.split()[11]
        strand=ln.split()[3]
        fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom, start, end, gene, score, strand))
fout.close()
