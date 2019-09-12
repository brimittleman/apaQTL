infile=open("/project2/gilad/briana/apaQTL/data/netseq/netseq_TSS.fc", "r")
fout=open("/project2/gilad/briana/apaQTL/data/netseq/netseq_TSS.fixed.fc", "w")



#Geneid	Chr	Start	End	Strand	Length
for i, ln in enumerate(infile):
    if i ==1:
      header=ln.split()
      intro=header[0:6]
      indiv=header[6:]
      newIndividual=[]
      for each in indiv:
          eachfix=each.split("/")[-1].split("-")[3].split("_")[0]
          newind="Netseq_NA" + eachfix
          newIndividual.append(newind)
      newline=intro + newIndividual
      fout.write("\t".join(newline))
      fout.write("\n")
    if i >1:
      outline=ln.split()
      outline[0]=outline[0].split(".")[0]
      fout.write("\t".join(outline))
      fout.write("\n")
fout.close()
