def main(apa, eqtl, outFile):
    fout=open(outFile,"w")
    use_dic={}
    for ln in open(eQTL,"r"):
        egene=ln.split()[0]
        eSNP=ln.split()[5]
        use_dic[egene]=eSNP
    for ln in open(apa, "r"):
        geneApa=ln.split()[0].split(":")[-1].split("_")[0]
        snpApa =ln.split()[1]
        if geneApa in use_dic.keys():
            if snpApa == use_dic[geneApa]:
                fout.write(ln)
    fout.close()


if __name__ == "__main__":
    import sys
    import random
    fraction=sys.argv[1]
    OutFile=sys.argv[2]
    if fraction=="Total":
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt"
        eQTL="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inTot.txt"
    else:
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt"
        eQTL="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inNuc.txt"
    main(nomFile, eQTL, OutFile)
