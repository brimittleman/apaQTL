
def main(qtls,phenoFile,outfile):
    qtl_dic={}
    for ln in open(qtls,"r"):
        gene, snp=ln.split()
        if gene not in qtl_dic.keys():
            qtl_dic[gene]=[snp]
        else:
            qtl_dic[gene].append(snp)
    fout=open(outfile,"w")
    for ln in open(phenoFile, "r"):
        gene=ln.split()[0]
        snp=ln.split()[1]
        if gene in qtl_dic.keys():
            if snp in qtl_dic[gene]:
                fout.write(ln)
    fout.close()


if __name__ == "__main__":
    from misc_helper import *
    import sys
    qtls =sys.argv[1]
    pheno= sys.argv[2]
    if pheno=="RNA":
        phenoFile="../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName.txt"
    else:
        phenoFile="../data/molQTLs/fastqtl_qqnorm_prot.fixed.nominal.AllNomRes.GeneName.txt"
    outfile=sys.argv[3]
    main(qtls,phenoFile,outfile)
