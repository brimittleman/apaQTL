

def main(inBed, outSAF):
    fout=open(outSAF, "w")
    fout.write("GeneID\tChr\tStart\tEnd\tStrand")
    for ln in open(inBed, "r"):
        chrom, start, end, gene, loc, strand, peakid, mean=ln.split()
        chrom_fix=chrom[3:]
        newid="%s:%s:%s:%s:%s:%s_%s"%(peakid,chrom_fix, start, end, strand, gene, loc)
        fout.write("%s\t%s\t%s\t%s\t%s\n"%(newid, chrom_fix, start, end, strand))
    fout.close()
if __name__ == "__main__":
    from misc_helper import *
    import sys
    inBed =sys.argv[1]
    outSAF= sys.argv[2]
    main(inBed,outSAF)
