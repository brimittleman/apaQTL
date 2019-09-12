infile=open("../data/AnnotatedPAS/human.PAS.txt","r")

fout=open("../data/AnnotatedPAS/human.PAS.bed", "w")

for i, ln in enumerate(infile):
    if i>0:
        id=ln.split("\t")[0]
        chr=ln.split("\t")[1][3:]
        strand=ln.split("\t")[3]
        if strand == "-":
            newStrand="-"
            end=int(ln.split("\t")[2])
            start=end-1
        else:
            newStrand="+"
            start=int(ln.split("\t")[2])
            end=start+1
        gene=ln.split("\t")[8]
        location=ln.split("\t")[5].split(" ")
        location_fix="_".join(location)
        NewID=id +":" +gene + ":" + location_fix
        score="."
        fout.write("%s\t%d\t%d\t%s\t%s\t%s\n"%(chr, start, end, NewID, score, strand))
fout.close()
