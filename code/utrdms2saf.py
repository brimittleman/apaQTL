#chr1 67208778 67216822 NM_001308203.1_utr3_21_0_chr1_67208779_ 0 +
#GeneID	Chr	Start	End	Strand
#peak_chr10_67326_67405_+	10	67326	67405	+


inFile="/project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefseq_3UTR.dms"
fout=open("../data/Reads2UTR/ncbiRefseq_3UTR.SAF","w")
fout.write("GeneID\tChr\tStart\tEnd\tStrand\n")
for ln in open(inFile, "r"):
    chrom, start, end, id, score, strand=ln.split()
    chromnochr=chrom[3:]
    fout.write("%s\t%s\t%s\t%s\t%s\n"%(id, chromnochr, start, end, strand))
fout.close()
