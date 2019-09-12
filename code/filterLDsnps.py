


def main(infile,outfile):
    fin=open(infile, "r")
    fout=open(outfile, "w")
    print(infile)
    for i,ln in enumerate(fin):
        if i >0:
            linelist=ln.split()
            r2=linelist[6]
            if r2 != "R2" and r2 != "File" and r2 != "reference" and r2 != 'variant.""':
                r2=float(r2)
                snp=linelist[0]
                if r2 > .9:
                    fout.write("%s\n"%(snp))
    fout.close()



if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  inFile =sys.argv[1]
  outFile= sys.argv[2]
  main(inFile, outFile)
