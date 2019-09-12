infile=open("../data/fourSU/kallisto_4sU.txt", "r")
fout=open("../data/fourSU/kallisto_4sUfixed.txt","w")

for i, ln in enumerate(infile):
    if i==0:
        fout.write(ln)
    else:
        oldline=ln.split()
        geneid=oldline[0]
        #print(geneid)
        ensg="ENSG"
        newGene=ensg + geneid[4:]
        #print(newGene)
        newgenest="".join(newGene)
        oldline[0]=newgenest
        #print(oldline)
        fout.write("\t".join(oldline))
        fout.write("\n")
fout.close()
