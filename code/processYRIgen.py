infile=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.txt", "r")
fout=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.vcf", "w")


for i, ln in enumerate(infile):
    if i==0:
        ln_list=ln.split()
        ind=ln_list[9:]
        indnew=[]
        for each in ind:
            new="NA"+ str(each)
            indnew.append(new)
        ln_new=ln_list[:9] + indnew
        lnSTR="\t".join(ln_new)
        fout.write("%s\n"%lnSTR)
    else:
        ln_list=ln.split()
        ln_list[0]=ln_list[0][3:]
        ln_str="\t".join(ln_list)
        fout.write("%s\n"%ln_str)
fout.close()
