def main(genes, apa, outfile):
    useDic={}
    fout=open(outfile, "w")
    for ln in open(genes, "r"):
        gene=ln.strip()
        useDic[gene]=""
    for ln in open(apa, "r"):
        gene=ln.split()[0].split(":")[-1].split("_")[0]
        if gene in useDic.keys():
            fout.write(ln)
    fout.close()

if __name__ == "__main__":
    import sys
    genes =sys.argv[1]
    fraction= sys.argv[2]
    apa="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.%s_permRes.txt"%(fraction)
    outfile=sys.argv[3]
    main(genes, apa, outfile)
