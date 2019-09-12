
def main(infile,outfile):
    snps="/project2/gilad/briana/li_genotypes/RSID2snploc.txt"
    snp_dic={}
    for ln in open(snps):
        snp, rsid,ref, alt = ln.split()
        snp_dic[rsid]=snp
    fout=open(outfile, "w")
    qtls=open(infile, "r")
    fout.write("SNPchr\tSNPstart\tSNPend\tname\tscore\tstrand\n")
    for i, ln in enumerate(qtls):
        if i > 0:
            rsid=ln.split()[11]
            snp=snp_dic[rsid]
            chrom=snp.split(":")[0]
            start=int(snp.split(":")[1]) -1
            end= snp.split(":")[1]
            score=ln.split()[12]
            strandold=ln.split()[5]
            if strandold =="+":
                strand="-"
            else:
                 strand="+"
            gene=ln.split()[3]
            peak=ln.split()[6]
            Loc=ln.split()[4]
            name=gene + ":" + peak + ":" + Loc
            fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom, start, end, name, score, strand))
    fout.close()


if __name__ == "__main__":
    import sys
    fraction = sys.argv[1]
    infile= "../data/apaQTLs/%s_apaQTLs4pc_5fdr.txt"%(fraction)
    outfile="../data/apaQTLs/%s_apaQTLs4pc_5fdr.WITHSTRAND.bed"%(fraction)
    main(infile, outfile)
