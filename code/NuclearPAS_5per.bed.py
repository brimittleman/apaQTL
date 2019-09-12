
infile=open("../data/peaks_5perc/APApeak_Peaks_GeneLocAnno.Nuclear.5perc.fc","r")
fout=open("../data/PAS/APApeak_Peaks_GeneLocAnno.Nuclear.5perc.bed","w")


for ln in infile:
    chr=ln.split()[0][3:]
    strand=ln.split()[5]
    if strand=="-":
        nS="+"
        end=int(ln.split()[2])
        start=end-1
    else:
        nS="-"
        end=int(ln.split()[1])
        start=end-1
    peaknum=ln.split()[6][4:]
    gene=ln.split()[3]
    loc=ln.split()[4]
    usage=ln.split()[-1]
    id=peaknum + ":" + gene + ":" + loc
    fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chr,start, end, id, usage, nS))
fout.close()
