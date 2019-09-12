def main(peaks, APA,nonE,eqtl, outF):
    #dictionary of non egenes
    nonEgenes={}
    for ln in open(nonE):
        gene=ln.split()[0]
        nonEgenes[gene]=""

    # make dictionary- key= npeak, value=list of genes with same value (use this when i need to pull random from the values)
    #only add genes in the non eqet
    peaknum={}
    for ln in open(peaks, "r"):
        gene, npeak = ln.split()
        if npeak not in peaknum.keys():
            if gene in nonEgenes.keys():
                peaknum[npeak]=[gene]
        else:
            if gene in nonEgenes.keys():
                 peaknum[npeak].append(gene)
    #make opposite dic- key =gene, value = npeaks (use this when i first get an EGENE to see how many peaks i will need)
    #want all genes- e and no e genes
    GenePeak={}
    for ln in open(peaks, "r"):
        gene, npeak= ln.split()
        GenePeak[gene]=npeak
    #print(GenePeak)
    eQTLs= open(eqtl, "r")
    gene_useDic={}
    for ln in eQTLs:
        gene= ln.split()[0]
        peaks2use=GenePeak[gene]
        posibleGenes=peaknum[peaks2use]
        if len(posibleGenes) == 0:
             print("No genes with peaknum")
             posibleGenes=peaknum[str(int(peaks2use)+1)]
             if len(posibleGenes) == 0:
                 print("No genes with peaknum")
                 continue
        GeneUse=random.choice(posibleGenes)
        gene_useDic[GeneUse]=""
        #print(GeneUse)
        #find the snp that goes with this gene in the non egenes file- this gives me the lowest pval snp
    for ln in open(nonE,"r"):
        genenon=ln.split()[0]
        #print(genenon)
        if genenon in gene_useDic.keys():
            snpUse=ln.split()[5]
            gene_useDic[genenon]=snpUse
        #now i have the gene and the snp, i can write out any of the nominal values from the apa file with these
    fout=open(outF,"w")
    for ln in open(APA, "r"):
        geneApa=ln.split()[0].split(":")[-1].split("_")[0]
        snpApa =ln.split()[1]
        if geneApa in gene_useDic.keys():
            if snpApa == gene_useDic[geneApa]:
                fout.write(ln)
    fout.close()



if __name__ == "__main__":
    import sys
    import random
    fraction=sys.argv[1]
    OutFile=sys.argv[2]
    if fraction=="Total":
        print("total")
        npeaks="../data/overlapeQTLs/TotalQTL_nPeaks.txt"
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt"
        nonEfile="../data/overlapeQTLs/permRes_NOTeQTLs_GeneNames_inTot.txt"
        eQTL="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inTot.txt"
    else:
        print("nuclear")
        npeaks="../data/overlapeQTLs/NuclearQTL_nPeaks.txt"
        nomFile="../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt"
        nonEfile="../data/overlapeQTLs/permRes_NOTeQTLs_GeneNames_inNuc.txt"
        eQTL="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inNuc.txt"
    main(npeaks, nomFile, nonEfile, eQTL, OutFile)
