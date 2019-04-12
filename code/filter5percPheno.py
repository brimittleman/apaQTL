  #python
def main(inF, outF):
  totalokPeaks5perc={}
  for ln in open(inF,"r"):
      peakname=ln.split()[5]
      totalokPeaks5perc[peakname]=""

  totalPhenoBefore=open(inF,"r")
  totalPhenoAfter=open(outF, "w")
  for num, ln in enumerate(totalPhenoBefore):
      if num ==0:
          totalPhenoAfter.write(ln)
      else:
          id=ln.split()[0].split(":")[3].split("_")[2]
          if id in totalokPeaks5perc.keys():
              totalPhenoAfter.write(ln)
  totalPhenoAfter.close()  

if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  inFile =sys.argv[1]
  outFile= sys.argv[2]
  main(inFile, outFile)
