#fc2leafphen.py


inFile=open("../data/bothFrac_FC/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fixed.fc", "r")
outFile= open("../data/DiffIso/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fixed.forLC.fc", "w")

for num, ln in enumerate(inFile):
        if num == 1:
            lines=ln.split()[6:]
            outFile.write(" ".join(lines)+'\n')
        if num > 1:
            ID=ln.split()[0]
            peak=ID.split(":")[0]
            chrom=ID.split(":")[1]
            start=ID.split(":")[2]
            start=int(start)
            end=ID.split(":")[3]
            end=int(end)
            strand=ID.split(":")[4]
            gene=ID.split(":")[5]
            new_ID="chr%s:%d:%d:%s"%(chrom, start, end, gene)
            pheno=ln.split()[6:]
            pheno.insert(0, new_ID)
            outFile.write(" ".join(pheno)+'\n')

outFile.close()
