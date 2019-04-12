
def main(inFile, outFile):
    fout=open(outFile,'w')
    fout.write("GeneID\tChr\tStart\tEnd\tStrand\n")
    for ln in open(inFile, "r"):
         chrom, start, end, score, strand, score2 = ln.split()
         ID = "peak_%s_%s_%s"%(chrom,start, end)
         fout.write("%s\t%s\t%s\t%s\t+\n"%(ID+"_+", chrom.replace("chr",""), start, end))
         fout.write("%s\t%s\t%s\t%s\t-\n"%(ID+"_-", chrom.replace("chr",""), start, end))
    fout.close()


if __name__ == "__main__":
    import sys
    inFile =sys.argv[1]
    outFile= sys.argv[2]
    main(inFile, outFile)
