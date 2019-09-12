infile=open("../data/RNAseq/fastqtl_qqnorm_RNAseqGeuvadis_phase2.fixed.txt", "r")
fout=open("../data/RNAseq/fastqtl_qqnorm_RNAseqGeuvadis_phase2.fixed4Corr.txt", "w")

for i, ln in enumerate(infile):
    if i==0:
        header=ln.split()
        indiv=header[4:]
        newIndividual=[]
        for each in indiv:
            newind="RNA_" + each
            newIndividual.append(newind)
        newline=header[0:4] + newIndividual
        fout.write("\t".join(newline))
        fout.write("\n")
    else:
        fout.write(ln)
fout.close()
