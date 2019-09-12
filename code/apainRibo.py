apaQTLs=open("../data/apaQTLs/Nuclear_apaQTLs4pc_5fdr.txt", "r")
riboQTLnom=open("../data/molQTLs/fastqtl_qqnorm_ribo.fixed.nominal.AllNomRes.GeneName.txt","r")


apainRibo=open("../data/pQTLoverlap/NucAPAinRibo.txt", "w")



apaDic={}
for i, ln in enumerate(apaQTLs):
    if i > 0:
        gene=ln.split()[3]
        snp=ln.split()[11]
        if gene not in apaDic.keys():
            apaDic[gene]=[snp]
        else:
            apaDic[gene].append(snp)

for ln in riboQTLnom:
    ribogene=ln.split()[0]
    ribosnp=ln.split()[1]
    if ribogene in apaDic.keys():
        if ribosnp in apaDic[ribogene]:
            apainRibo.write(ln)
apainRibo.close()
