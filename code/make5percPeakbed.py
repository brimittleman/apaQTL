def main(tot, nuc, all, outF):
   peakDic={}
   for ln in open(nuc, "r"):
       peaknum=ln.split()[5][4:]
       if peaknum not in peakDic.keys():
           peakDic[peaknum]=""
   for ln in open(tot, "r"):
       peaknum=ln.split()[5][4:]
       if peaknum not in peakDic.keys():
           peakDic[peaknum]=""
   fout=open(outF, "w")
   for ln in open(all, "r"):
       geneid, chrom, start, end, strand = ln.split()
       peak=int(geneid.split(":")[0][4:])
       if peak in peakDic.keys():
           geneloc=geneid.split(":")[-1]
           name= chr(peak) + ":" + geneloc
           score= "."
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
