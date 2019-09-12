def main(nom, qtl, outfile):
    qtl_dic={}
    for ln in open(qtl,"r"):
        #peak14328 OPTN rs765884
        pas, gene, snp= ln.split()
        if gene not in qtl_dic.keys():
            qtl_dic[gene]=[snp]
        else:
            qtl_dic[gene].append(snp)
    fout=open(outfile,"w")
#10:197163:197245:ZMYND11_intron_-_peak13646 rs148087467 -136641 0.759769 0.147459
    fout.write("gene\tsnp\tpas\tEffectSize\n")
    for ln in open(nom,"r"):
        pasID=ln.split()[0]
        gene=pasID.split(":")[-1].split("_")[0]
        snp=ln.split()[1]
        pas=pasID.split(":")[-1].split("_")[-1]
        slope=ln.split()[-1]
        if gene in qtl_dic.keys():
            if snp in qtl_dic[gene]:
                fout.write("%s\t%s\t%s\t%s\n"%(gene, snp, pas, slope))
    fout.close()



if __name__ == "__main__":
    from misc_helper import *
    import sys
    fraction =sys.argv[1]
    if fraction=="Total":
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt"
    else:
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt"
    qtlfile=sys.argv[2]
    outfile=sys.argv[3]
    main(nomFile,qtlfile,outfile)
