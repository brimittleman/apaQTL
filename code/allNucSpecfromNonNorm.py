inQTLS=open("../data/NucSpeceQTLeffect/AllNucSpecapaQTLs.txt", "r")
inNonNorm=open("../data/nonNorm_pheno/NuclearUsageChrom_Nominal_AllChrom.txt", "r")
fout=open("../data/eQTLs/Nuclearspecific_NucSpecPAS_nonnorm.txt", "w")

QTL_dic={}
for i, ln in enumerate(inQTLS):
     if i>0:
         pas=ln.split()[6]
         snp=ln.split()[11]
         if pas not in QTL_dic.keys():
             QTL_dic[pas]=[snp]
         else:
             QTL_dic[pas].append(snp)

for ln in inNonNorm:
    NNpas=ln.split()[0].split("_")[-1]
    NNsnp=ln.split()[1]
    if NNpas in QTL_dic.keys():
        if NNsnp in QTL_dic[NNpas]:
            fout.write(ln)
fout.close()
