#python file to name peaks


def main(inFile, outFile):
    rows=0
    for in open(inFile, "r"):
        rows +=1
    rowname=list(range(1, rows+1))
    outF=open(outFile, "w")
    inF= open(inFile, "r")
    for i, ln in enumerate(inF):
        chrom, start, end, cov, strand, score = ln.split()
        chromNoch=chrom[3:]
        name=rowname[i + 1]
        outF.write("%s\t%s\t%s\t%d\t%s\t%s\t%s\n"%(chromNoch, start, end, name, cov, strand, score))
    outF.close()


if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys
    inFile =sys.argv[1]
    outFile= sys.argv[2]
    main(inFile, outFile)
