infile="../data/intronRNAratio/NuclearIntronicPAS2Intron.txt"
outfileSAF="../data/intronRNAratio/NuclearIntronicPAS_intronUpstream.SAF"
outfilebed="../data/intronRNAratio/NuclearIntronicPAS_intronUpstream.bed"
foutSAF=open(outfileSAF, "w")
foutbed=open(outfilebed, "w")

foutSAF.write("GeneID\tChr\tStart\tEnd\tStrand")
for ln in open(infile, "r"):
    chrom, intronStart, intronEnd, gene, strand, PASID, PASloc, meanUsage= ln.split()
    GeneId=PASID + ":" + str(PASloc) + ":" + str(meanUsage)
    chromosome=chrom[3:]
    score="."
    if strand == "+":
        start=intronStart
        end=PASloc
    else:
        start=PASloc
        end=intronEnd
    foutSAF.write("%s\t%s\t%s\t%s\t%s\n"%(GeneId,chromosome, start, end, strand))
    foutbed.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chromosome,start, end, GeneId, score, strand))
foutSAF.close()
foutbed.close()
