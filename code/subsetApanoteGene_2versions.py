def main(apa, outfile):
    useDic={}

    fout=open(outfile, "w")
    for ln in open("../data/Li_eQTLs/explainedEgenes.txt", "r"):
        gene=ln.strip()
        useDic[gene]=""
    for ln in open("../data/Li_eQTLs/UnexplainedEgenes.txt", "r"):
        gene=ln.strip()
        useDic[gene]=""
    for ln in open(apa, "r"):
        gene=ln.split()[0].split(":")[-1].split("_")[0]
        if gene not in useDic.keys():
            fout.write(ln)
    fout.close()

if __name__ == "__main__":
    import sys
    number= sys.argv[1]
    apa="../data/Version15bp%sAs/apaQTLPermuted/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp%sA.5perc_permRes.txt"%(number,number)
    outfile=sys.argv[2]
    main(apa, outfile)
