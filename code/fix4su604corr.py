infile=open("../data/fourSU/fastqtl_qqnorm_4su_60_phase2.fixed.txt", "r")
fout=open("../data/fourSU/fastqtl_qqnorm_4su_60_phase2.fixed4corr.txt", "w")

for i, ln in enumerate(infile):
    if i==0:
        header=ln.split()
        indiv=header[4:]
        newIndividual=[]
        for each in indiv:
            newind="foursu60_" + each
            newIndividual.append(newind)
        newline=header[0:4] + newIndividual
        fout.write("\t".join(newline))
        fout.write("\n")
    else:
        fout.write(ln)
fout.close()
