#create .sample file for plink

inSample=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.gen","r")
fout=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.sample","w")
fout.write("ID_1 ID_2 case\n")
fout.write("O O B\n")
for i, ln in enumerate(inSample):
    if i==0:
        line=ln.split()[9:]
        for each in line:
            fout.write("%s YRI 0\n"%(each))
fout.close()
