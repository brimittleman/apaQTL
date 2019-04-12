

def main(infile, outfile):
  final=open(outfile, "w")
  for ln in open(infile, "r"):
    line_list=ln.split()
    new_list=[]
    for i in line_list:
      num, dem = i.split("/")
      if dem == "0":
        perc = "0.00"
      else:
        perc = int(num)/int(dem)
        perc=round(perc,2)
        perc= str(perc)
      new_list.append(perc)
    final.write("\t".join(new_list)+ '\n')
  final.close()


if __name__ == "__main__":
  import numpy as np
  from misc_helper import *
  import sys
  inFile =sys.argv[1]
  outFile= sys.argv[2]
  main(inFile, outFile)
