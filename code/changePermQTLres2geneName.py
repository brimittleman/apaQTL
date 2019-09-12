

geneNamedic={}
for ln in open("../../genome_anotation_data/ensemble_to_genename.txt", "r"):
    ensg=ln.split()[0]
    name=ln.split()[1]
    geneNamedic[ensg]=name
#print(type(geneNamedic))

protOut="../data/molQTLs/fastqtl_qqnorm_prot.fixed.perm.AllNomRes.GeneName.txt"
protIn="../data/molQTLs/fastqtl_qqnorm_prot.fixed.perm.AllNomRes.txt"

RNAOut="../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.perm.AllNomRes.GeneName.txt"
RNAin="../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.perm.AllNomRes.txt"

pOut=open(protOut,"w")
for ln in open(protIn, "r"):
    linelist=ln.split()
    gene=linelist[0]
    #print(gene)
    if gene in geneNamedic.keys():
        geneName=geneNamedic[gene]
        linelist[0]=geneName
        newline="\t".join(linelist)
        pOut.write("%s\n"%(newline))
    else:
        continue
pOut.close()

rOut=open(RNAOut, "w")
for ln in open(RNAin):
    linelist=ln.split()
    gene=linelist[0].split(".")[0]
    #print(gene)
    if gene in geneNamedic.keys():
        geneName=geneNamedic[gene]
        linelist[0]=geneName
        newline="\t".join(linelist)
        rOut.write("%s\n"%(newline))
    else:
        continue
rOut.close()
