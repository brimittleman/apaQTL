def main(tot, nuc, allP, outF):
   peakDic={}
   for ln in open(nuc, "r"):
       peaknum=int(ln.split()[6][4:])
       if peaknum not in peakDic.keys():
           peakDic[peaknum]=""
   for ln in open(tot, "r"):
       peaknum=int(ln.split()[6][4:])
       if peaknum not in peakDic.keys():
           peakDic[peaknum]=""
   fout=open(outF, "w")
   allPeak=open(allP, "r")
   for i, ln in enumerate(allPeak):
       if i > 0:
           geneid, chrom, start, end, strand = ln.split()
           peak=int(geneid.split(":")[0][4:])
           if peak in peakDic.keys():
               geneloc=geneid.split(":")[-1]
               peakc=str(peak)
               name= peakc + ":" + geneloc
               score="."
               fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom, start, end, name, score, strand))
   fout.close()


if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  total =sys.argv[1]
  nuclear=sys.argv[2]
  allPeak=sys.argv[3]
  outFile= sys.argv[4]
  main(total,nuclear,allPeak,outFile)
