nuclearQTL=open("../data/apaQTLs/NuclearQTLSNPsRSID_withLD.txt","r")
qtl_dic={}
for ln in nuclearQTL:
    snp=ln.split()[0]
    qtl_dic[snp]=""

fout=open("../data/GWAS_overlap/NuclearSNPinGWAS_withLD.txt", "w")

for ln in open("../data/GWAS_overlap/gwasCatalog", "r"):
    snp=ln.split()[4]
    if snp in qtl_dic.keys():
        fout.write(ln)
fout.close()
