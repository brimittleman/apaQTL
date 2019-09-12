def main(inFile, outFile, target):
    ifile=open(inFile, "r")
    ofile=open(outFile, "w")
    target=int(target)
    for num, ln in enumerate(ifile):
        if num == 0:
            ofile.write(ln)
        else:
            ID=ln.split()[0]
            chrom=ID.split(":")[0][3:]
            #print(chrom)
            chrom=int(chrom)
            if chrom == target:
                ofile.write(ln)

if __name__ == "__main__":
    import sys

    target = sys.argv[1]
    inFile = "../data/DiffIso/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fixed.forLC_noloc.fc"
    outFile = "../data/DiffIso/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fixed.forLC.fc_%s.txt"%(target)
    main(inFile, outFile, target)
