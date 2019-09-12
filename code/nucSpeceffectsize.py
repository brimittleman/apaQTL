

totPAS={}
for ln in open("../data/nonNorm_pheno/TotalUsageChrom_Nominal_AllChrom.txt", "r"):
    pas=ln.split()[0].split("_")[-1]
    if pas not in totPAS.keys():
        totPAS[pas]=""
nucQTL_nottot={}

for ln in open("../data/apaQTLs/Nuclear_apaQTLs4pc_5fdr.txt", "r"):
    pas=ln.split()[6]
    if pas not in totPAS.keys():
        snp=ln.split()[11]
        nucQTL_nottot[pas]=snp

#print(nucQTL_nottot)
fout=open("../data/QTLoverlap_nonNorm/NuclearSpecQTLinNuclearNominal_nonNorm.txt", "w")

for ln in open("../data/nonNorm_pheno/NuclearUsageChrom_Nominal_AllChrom.txt", "r"):
    pas=ln.split()[0].split("_")[-1]
    #print(pas)
    snp=ln.split()[1]
    #print(snp)
    if pas in nucQTL_nottot.keys():
        if nucQTL_nottot[pas]==snp:
            fout.write(ln)
fout.close()
