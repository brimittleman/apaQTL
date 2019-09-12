totAPA="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Total_permRes.txt"
NucAPA="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear_permRes.txt"


nonEQTLs="/project2/gilad/briana/threeprimeseq/data/eQTL_myanalysis/permRes_NOTeQTLs_GeneNames.txt"
eQTLs="/project2/gilad/briana/threeprimeseq/data/eQTL_myanalysis/permRes_significanteQTLs_GeneNames.txt"

eQTLS_intot="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inTot.txt"
eQTLS_innuc="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inNuc.txt"

nonEQTL_intot="../data/overlapeQTLs/permRes_NOTeQTLs_GeneNames_inTot.txt"

nonEQTL_innuc="../data/overlapeQTLs/permRes_NOTeQTLs_GeneNames_inNuc.txt"


def check_names(inApa, ineqtl, outFile):
    gene_dic={}

    for ln in open(inApa, "r"):
        gene=ln.split()[0].split(":")[-1].split("_")[0]
        if gene not in gene_dic.keys():
            gene_dic[gene]=""
        else:
            continue
    fileOut= open(outFile, "w")
    nnottested=0
    for ln in open(ineqtl, "r"):
        gene=ln.split()[0]
        if gene in gene_dic.keys():
            fileOut.write(ln)
        else:
            nnottested += 1
    print("Number of genes not tested in apa = %s"%(nnottested))
    fileOut.close()


print("total")
check_names(totAPA,nonEQTLs, nonEQTL_intot)
print("nuclear")
check_names(NucAPA,nonEQTLs, nonEQTL_innuc)

print("total")
check_names(totAPA,eQTLs, eQTLS_intot)
print("nuclear")
check_names(NucAPA,eQTLs, eQTLS_innuc)
