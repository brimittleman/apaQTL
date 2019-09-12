#this script takes permuted QTL results and the nominal file and extracts the results. I am using this to find the 39 individual association beta values for the Qtls called in the full set of ind.

def main(inQTL,inRes,outFile):
    qtl_dict={}
    #10:187714:187799:ZMYND11_intron_-_peak13645
    for ln in open(inQTL, "r"):
        chrom=ln.split()[0]
        start=ln.split()[1]
        end=ln.split()[2]
        gene=ln.split()[3]
        loc=ln.split()[4]
        strand=ln.split()[5]
        peak=ln.split()[6]
        newID="%s:%s:%s:%s_%s_%s_%s"%(chrom, start, end, gene, loc, strand, peak)
        snp=ln.split()[11]
        if newID not in qtl_dict.keys():
            qtl_dict[newID]=snp
        #print(qtl_dict)
    fout=open(outFile, "w")
    for ln in open(inRes,"r"):
        id=ln.split()[0]
        snp=ln.split()[1]
        if id in qtl_dict.keys():
            #print("true")
            if snp== qtl_dict[id]:
                fout.write(ln)
    fout.close()

if __name__ == "__main__":
    from misc_helper import *
    import sys
    inQTLs =sys.argv[1]
    inRes= sys.argv[2]
    outFile=sys.argv[3]
    main(inQTLs,inRes, outFile)
