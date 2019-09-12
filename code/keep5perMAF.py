infile=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.vcf", "r")
fout=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf", "w")

for i, ln in enumerate(infile):
    if i==0:
        fout.write(ln)
    else:
        dosages=ln.split()[9:]
        dosagesfl=[float(i) for i in dosages]
        if sum(dosagesfl) >= .05:
            fout.write(ln)
fout.close()
