apaQTLs=open("../data/apaQTLs/Nuclear_apaQTLs4pc_5fdr.txt", "r")
eQTLnom=open("../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName.txt","r")
pQTLnom=open("../data/molQTLs/fastqtl_qqnorm_prot.fixed.nominal.AllNomRes.GeneName.txt","r")

apainP=open("../data/pQTLoverlap/NucAPAinProt.txt", "w")
apainE=open("../data/pQTLoverlap/NucAPAinExpression.txt", "w")


apaDic={}
for i, ln in enumerate(apaQTLs):
    if i > 0:
        gene=ln.split()[3]
        snp=ln.split()[11]
        if gene not in apaDic.keys():
            apaDic[gene]=[snp]
        else:
            apaDic[gene].append(snp)

for ln in eQTLnom:
    egene=ln.split()[0]
    esnp=ln.split()[1]
    if egene in apaDic.keys():
        if esnp in apaDic[egene]:
            apainE.write(ln)
apainE.close()

for ln in pQTLnom:
    pgene=ln.split()[0]
    psnp=ln.split()[1]
    if pgene in apaDic.keys():
        if psnp in apaDic[pgene]:
            apainP.write(ln)
apainP.close()
