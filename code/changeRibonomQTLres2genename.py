

geneNamedic={}
for ln in open("../../genome_anotation_data/ensemble_to_genename.txt", "r"):
    ensg=ln.split()[0]
    name=ln.split()[1]
    geneNamedic[ensg]=name
#print(type(geneNamedic))

riboOut="../data/molQTLs/fastqtl_qqnorm_ribo.fixed.nominal.AllNomRes.GeneName.txt"
riboIn="../data/molQTLs/fastqtl_qqnorm_ribo.fixed.nominal.AllNomRes.txt"

rOut=open(riboOut, "w")
for ln in open(riboIn):
    linelist=ln.split()
    gene=linelist[0].split(".")[0]
    #print(gene +" - " +linelist[0])
    if gene in geneNamedic.keys():
        geneName=geneNamedic[gene]
        linelist[0]=geneName
        newline="\t".join(linelist)
        rOut.write("%s\n"%(newline))
    else:
        continue
rOut.close()
