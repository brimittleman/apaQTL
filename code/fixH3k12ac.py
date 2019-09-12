infile=open("../data/h3k27ac/H3K27acShyam_TSS.txt","r")
outfile="../data/h3k27ac/H3K27acShyam_TSS_fixed.txt"


#../run_integrated/H3K27acShyam/final_mapped/H3K27acShyam_18522.merged.sort.bam


fout=open(outfile,"w")
for i, ln in enumerate(infile):
    if i==1:
        header=ln.split()
        start=header[:6]
        indiv=header[6:]
        newIndividual=[]
        for each in indiv:
            num= each.split("/")[4].split("_")[1].split(".")[0]
            individual= "H3k12ac_NA"+ num
            newIndividual.append(individual)
        newline=start + newIndividual
        fout.write("\t".join(newline))
        fout.write("\n")
    if i>1:
      outline=ln.split()
      outline[0]=outline[0].split(".")[0]
      fout.write("\t".join(outline))
      fout.write("\n")
fout.close()
