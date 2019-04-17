def main(inF, outF):
  fout=open(outF,"w")
  for ln in open(inF, "r"):
      chrom, start, end, name, score, strand= ln.split()
      if strand == "+":
          #switch to neg strand
          # pas is first base
          startPAS=int(start) -1
          endPAS=int(start)
          fout.write("%s\t%s\t%s\t%s\t%s\t-\n"%(chrom, startPAS, endPAS, name, score))
      else:
          #switch 2 pos strand
          #PAS is last base
          startPAS=int(end) -1
          endPAS=int(end)
          fout.write("%s\t%s\t%s\t%s\t%s\t+\n"%(chrom, startPAS, endPAS, name, score))
  fout.close()

if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  infile =sys.argv[1]
  outfile=sys.argv[2]
  main(infile,outfile)
