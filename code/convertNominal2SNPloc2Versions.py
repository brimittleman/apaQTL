
def main(infile,outfile):
    snps="/project2/gilad/briana/li_genotypes/RSID2snploc.txt"
    snp_dic={}
    for ln in open(snps):
        snp, rsid,ref, alt = ln.split()
        snp_dic[rsid]=snp
    fout=open(outfile, "w")
    for ln in open(infile, "r"):
        lnlist=ln.split()
        rs=lnlist[1]
        lnlist[1]=snp_dic[rs]
        newline="\t".join(lnlist)
        fout.write("%s\n"%(newline))
    fout.close()







if __name__ == "__main__":
    import sys
    number = sys.argv[1]
    infile= "../data/Version15bp%sAs/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp%sA.5perc_nomRes.txt"%(number,number)
    outfile="../data/Version15bp%sAs/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp%sA.5perc_nomRes_SNPLOC.txt"%(number,number)
    main(infile, outfile)
