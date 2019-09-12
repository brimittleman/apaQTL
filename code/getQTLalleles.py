
def main(infile, outfile):
    fout=open(outfile,"w")
    QTLs=open(infile, "r")
    qtl_dic={}
    fout.write("SNP\tRef\tAlt\n")
    for i, ln in enumerate(QTLs):
        if i !=0:
            snp=ln.split()[11]
            qtl_dic[snp]=[]
    vcf=open("/project2/gilad/briana/YRI_geno_hg19/allChrom.dose.filt.vcf", "r")
    for ln in vcf:
        #print(ln)
        if ln.startswith("#") == False:
            var=ln.split()[2]
            #print(var)
            if var in qtl_dic:
                ref=ln.split()[3]
                alt=ln.split()[4]
                qtl_dic[var].append(ref)
                qtl_dic[var].append(alt)
    print(qtl_dic)
    for key,value in qtl_dic.items():
            val_list=[]
            for i in value:
                val_list.append(str(i))
            valstr="\t".join(val_list)
            fout.write("%s\t%s\n"%(key,valstr))
    fout.close()



if __name__ == "__main__":
    from misc_helper import *
    import sys
    fraction =sys.argv[1]
    infile="../data/apaQTLs/%s_apaQTLs4pc_5fdr.txt"%(fraction)
    outfile="../data/motifdistrupt/apaQTL_%s_alleles.txt"%(fraction)
    main(infile,outfile)
