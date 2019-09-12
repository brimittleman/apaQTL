

nucPAS={}
for ln in open("../data/nonNorm_pheno/NuclearUsageChrom_Nominal_AllChrom.txt", "r"):
    pas=ln.split()[0].split("_")[-1]
    if pas not in nucPAS.keys():
        nucPAS[pas]=""
totQTL_notnuc={}

for ln in open("../data/apaQTLs/Total_apaQTLs4pc_5fdr.txt", "r"):
    pas=ln.split()[6]
    if pas not in nucPAS.keys():
        snp=ln.split()[11]
        totQTL_notnuc[pas]=snp

#print(nucQTL_nottot)
fout=open("../data/QTLoverlap_nonNorm/TotalSpecQTLinTotalNominal_nonNorm.txt", "w")

for ln in open("../data/nonNorm_pheno/TotalUsageChrom_Nominal_AllChrom.txt", "r"):
    pas=ln.split()[0].split("_")[-1]
    #print(pas)
    snp=ln.split()[1]
    #print(snp)
    if pas in totQTL_notnuc.keys():
        if totQTL_notnuc[pas]==snp:
            fout.write(ln)
fout.close()
