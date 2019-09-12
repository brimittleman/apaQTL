#getApaPval4eQTLs.py

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
    number=sys.argv[1]
    OutFile=sys.argv[2]
    if fraction=="6":
        nomFile="../data/Version15bp7As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp6A.5perc_nomRes.txt"
        eQTL="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inNuc.txt"
    else:
        nomFile="../data/Version15bp7As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp7A.5perc_nomRes.txt"
        eQTL="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inNuc.txt"
    main(nomFile, eQTL, OutFile)
