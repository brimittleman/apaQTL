infile="../data/intronRNAratio/NuclearIntronicPAS2Intron.txt"
outfileSAF="../data/intronRNAratio/NuclearIntronicPAS_intronDownstream.SAF"
outfilebed="../data/intronRNAratio/NuclearIntronicPAS_intronDownstream.bed"
foutSAF=open(outfileSAF, "w")
foutbed=open(outfilebed, "w")

foutSAF.write("GeneID\tChr\tStart\tEnd\tStrand")
for ln in open(infile, "r"):
    chrom, intronStart, intronEnd, gene, strand, PASID, PASloc, meanUsage= ln.split()
    GeneId=PASID + ":" + str(PASloc) + ":" + str(meanUsage)
    chromosome=chrom[3:]
    score="."
    if strand == "+":
        start=PASloc
        end=intronEnd
    else:
        start=intronStart
        end=PASloc
    foutSAF.write("%s\t%s\t%s\t%s\t%s\n"%(GeneId,chromosome, start, end, strand))
    foutbed.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chromosome,start, end, GeneId, score, strand))
foutSAF.close()
foutbed.close()
