def main(apa, eqtl, outFile):
    fout=open(outFile,"w")
    use_dic={}
    for ln in open(eqtl,"r"):
        egene=ln.split()[2]
        chrom=ln.split()[0]
        loc=ln.split()[1]
        eSNP=str(chrom)+ ":" + str(loc)
        if egene not in use_dic:
            use_dic[egene]=[eSNP]
        else:
            use_dic[egene].append(eSNP)
    for ln in open(apa, "r"):
        geneApa=ln.split()[0].split(":")[-1].split("_")[0]
        snpApa =ln.split()[1]
        if geneApa in use_dic.keys():
            if snpApa in use_dic[geneApa]:
                fout.write(ln)
    fout.close()


if __name__ == "__main__":
    import sys
    import random
    apaFile=sys.argv[1]
    eqtlFile=sys.argv[2]
    outFile=sys.argv[3]
    main(apaFile, eqtlFile, outFile)
