

def main(inFile, outFile, target):
    fout=open(outFile,"w")
    fin=open(inFile, "r")
    for i, ln in enumerate(fin):
        if i == 0:
            newline="#" + ln
            fout.write(newline)
        if i > 0:
            chrom=ln.split()[0]
            if chrom ==target:
                fout.write(ln)
    fout.close()










if __name__ == "__main__":
    from misc_helper import *
    import sys
    target=sys.argv[1]
    fraction=sys.argv[2]
    inF="../data/nonNorm_pheno/%sUsageAllChrom.txt"%(fraction)
    outF="../data/nonNorm_pheno/%sUsageChrom%s.txt"%(fraction, target)
    main(inF,outF,target)
