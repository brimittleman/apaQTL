def main(infile,outfile):
  fout=open(outfile, "w")
  inf=open(infile,"r")
  for line, i in enumerate(inf):
      if line == 0:
          i_list=i.split()
          files= i_list[10:-2]
          for each in files:
              full = each.split("/")[7]
              samp= full.split("-")[2:4]
              lim="_"
              samp_st=lim.join(samp)
              outLine= full[:-1] + "\t" + samp_st
              fout.write(outLine + "\n")
  fout.close()


if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys
    inFile =sys.argv[1]
    outFile= sys.argv[2]
    main(inFile, outFile)
