pQTLs=open("../data/molQTLs/SigPqtls.txt", "r")
pQTLs_dic={}
for ln in pQTLs:
    gene=ln.split()[0]
    snp=ln.split()[5]
    if gene not in pQTLs_dic.keys():
        pQTLs_dic[gene]=[snp]
    else:
        pQTLs_dic[gene].append(snp)
#print(pQTLs_dic)

eQTLnom=open("../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName.txt","r")
pQTLinE=open("../data/pQTLoverlap/pQTLsineQTLdata.txt", "w")
for ln in eQTLnom:
    egene=ln.split()[0]
    #print(egene)
    esnp=ln.split()[1]
    if egene in pQTLs_dic.keys():
        if esnp in pQTLs_dic[gene]:
            pQTLinE.write(ln)
            print(ln)
pQTLinE.close()


apaQTLnom=open("../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt","r")
pQTLinapa=open("../data/pQTLoverlap/pQTLsinAPAQTLdata.txt", "w")
for ln in eQTLnom:
    #10:197163:197245:ZMYND11_intron_-_peak13646
    apagene=ln.split()[0].split(":")[-1].split("_")[0]
    apasnp=ln.split()[1]
    if apagene in pQTLs_dic.keys():
        if apasnp in pQTLs_dic[gene]:
            pQTLinapa.write(ln)
pQTLinapa.close()
