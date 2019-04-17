  #python
def main(okPeak, pheno, outF):
  totalokPeaks5perc={}
  for ln in open(okPeak,"r"):
      peakname=ln.split()[6]
      totalokPeaks5perc[peakname]=""

  totalPhenoBefore=open(pheno,"r")
  totalPhenoAfter=open(outF, "w")
  for num, ln in enumerate(totalPhenoBefore):
      if num ==0:
          totalPhenoAfter.write(ln)
      else:
          id=ln.split()[0].split(":")[3].split("_")[-1]
          if id in totalokPeaks5perc.keys():
              totalPhenoAfter.write(ln)
  totalPhenoAfter.close()

if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  okPeak =sys.argv[1]
  fullPheno=sys.argv[2]
  outFile= sys.argv[3]
  main(okPeak, fullPheno, outFile)
