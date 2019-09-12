inQTLS=open("../data/apaQTLs/NuclearSpecificAPAqtls.txt", "r")
inEres=open("../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName.txt", "r")
fout=open("../data/eQTLs/NuclearSPecificAPAqtlsinEqtl.txt", "w")

QTL_dic={}
for i, ln in enumerate(inQTLS):
     if i>0:
         gene=ln.split()[3]
         snp=ln.split()[11]
         if gene not in QTL_dic.keys():
             QTL_dic[gene]=[snp]
         else:
             QTL_dic[gene].append(snp)
#print(QTL_dic)
for ln in inEres:
    egene=ln.split()[0]
    esnp=ln.split()[1]
    if egene in QTL_dic.keys():
        if esnp in QTL_dic[egene]:
            fout.write(ln)
fout.close()
