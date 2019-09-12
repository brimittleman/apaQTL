def main(inQTL, inNom, outNom):
    #dictionary with qtls
    qtl_dic={}
    fin=open(inQTL, "r")
    for ln in fin:
      peak= ln.split()[0]
      snp=ln.split()[1]
      if peak not in qtl_dic.keys():
          qtl_dic[peak]=[snp]
      else:
          qtl_dic[peak].append(snp)
    fout=open(outNom, "w")
    for ln in open(inNom):
        peak=ln.split()[0].split(":")[-1].split("_")[-1]
        snp=ln.split()[1]
        if peak in qtl_dic.keys():
            if snp in qtl_dic[peak]:
                fout.write(ln)
    fout.close()

if __name__ == "__main__":
  from misc_helper import *
  import sys
  inQTL =sys.argv[1]
  inNom=sys.argv[2]
  outNom= sys.argv[3]
  main(inQTL, inNom,outNom)
