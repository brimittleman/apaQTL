def main(Fin, Fout):
  outBed=open(Fout, "w")

#write file
  for ln in open(Fin):
    chrom, start, end, name, score, strand = ln.split()
    chrom=str(chrom)
    if strand=="+":
      start_new=int(end)
      end_new= int(end) +10
      outBed.write("%s\t%d\t%d\t%s\t%s\t%s\n"%(chrom, start_new, end_new, name, score, strand))
    if strand == "-":
      start_new=int(end)-10
      if start_new <0:
          start_new=0
      end_new=int(end)
      outBed.write("%s\t%d\t%d\t%s\t%s\t%s\n"%(chrom, start_new, end_new, name, score, strand))
  outBed.close()

if __name__ == "__main__":
    import sys
    inFile = "../data/PAS/APAPAS_GeneLocAnno.5perc.sort.bed"
    outFile ="../data/PAS_postFlag/APAPAS_GeneLocAnno.5perc.10down.bed"
    main(inFile, outFile)
