


snp_dic={}
for ln in open("/project2/gilad/briana/li_genotypes/RSID2snploc.txt","r"):
    rsid=ln.split()[1]
    loc=ln.split()[0]
    snp_dic[rsid]=loc

fout=open("../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName_snploc.txt","w")
for ln in open("../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.AllNomRes.GeneName.txt", "r"):
    line_list=ln.split()
    snp=line_list[1]
    line_list[1]=snp_dic[snp]
    newline="\t".join(line_list)
    fout.write("%s\n"%(newline))
fout.close()
