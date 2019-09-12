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
    fraction= sys.argv[1]
    apa="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.%s_permRes.txt"%(fraction)
    outfile=sys.argv[2]
    main(apa, outfile)
