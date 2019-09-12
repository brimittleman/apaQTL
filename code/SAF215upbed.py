#SAF to 15 up bed
#usage python SAF215upbed.py outfile
def main(input, output):
    fin=open(input,"r")
    fout=open(output,"w")
    for i, ln in enumerate(fin):
        if i >0:
            name, Chr, Start, End, Strand = ln.split()
            if Strand=="+":
                start_new=int(Start)-15
                end_new=int(Start)
            else:
                start_new=int(End)
                end_new=int(End)+15
            score="."
            fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(Chr,start_new,end_new, name, score, Strand))

if __name__ == "__main__":
    import sys
    inFile = "../data/assignedPeaks/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.SAF"
    outFile = sys.argv[1]
    main(inFile, outFile)
