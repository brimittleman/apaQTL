def main(infile,outfile):
    fout=open(outfile, "w")
    fin=open(infile,"r")
    for num, ln in enumerate(fin):
        if num ==0:
            fout.write(ln)
        else:
            id=ln.split()[0]
            idnoloc=id.split("_")[0]
            fullline=ln.split()
            fullline[0]=idnoloc
            newline=" ".join(fullline)
            fout.write("%s\n"%(newline))






if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  inFile =sys.argv[1]
  outFile= sys.argv[2]
  main(inFile, outFile)
