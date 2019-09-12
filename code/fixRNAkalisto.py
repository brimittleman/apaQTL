infile=open("../data/RNAseq/kallisto_RNAseq.txt", "r")
fout=open("../data/RNAseq/kallisto_RNAseqfixed.txt","w")

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
