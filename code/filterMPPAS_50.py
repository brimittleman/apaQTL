def main(Fin,Nuc, Fout):
  outBed=open(Fout, "w")
  inBed=open(Fin, "r")
  inSeq=open(Nuc, "r")
  okPAS={}
  for ind, ln in enumerate(inSeq):
    if ind >=1:
      chrom,start, end, name, score, strand, pctAT, pctGC, A, C, G, T, N, Other, Length, Sequence = ln.split()
      seqUpper=Sequence.upper()
      if "AAAAAA" not in seqUpper:
          if int(A)/int(Length) < .7:
              okPAS[name]=""
  for ln in inBed:
      pasname=ln.split()[3]
      if pasname in okPAS.keys():
          outBed.write(ln)
  outBed.close()

if __name__ == "__main__":
    import sys
    inFile = "../data/PAS/APAPAS_GeneLocAnno.5perc.sort.bed"
    inNuc="../data/PAS_postFlag/APAPAS_GeneLocAnno.5perc.50downNUC.txt"
    outFile="../data/PAS/APAPAS_GeneLocAnno.5perc.sort.50noMP.bed"
    main(inFile,inNuc, outFile)
