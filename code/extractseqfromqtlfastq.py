
def main(infile, outfile):
    fout=open(outfile,"w")
    fin=open(infile,"r")
    for i,ln in enumerate(fin):
        if i % 2 == 1:
            newln=ln.strip().upper()
            fout.write("%s\n"%newln)
    fout.close()









if __name__ == "__main__":
    import sys
    fraction = sys.argv[1]
    infile= "../data/motifdistrupt/%sQTLregionSequences.fa"%(fraction)
    outfile="../data/motifdistrupt/%sQTLregionSequenceOnly.txt"%(fraction)
    main(infile, outfile)
