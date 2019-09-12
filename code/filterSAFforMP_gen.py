def main(Fin, insaf, Fout,filtnum):
  outSAF=open(Fout, "w")
  inSAF=open(insaf, "r")
  finNuc=open(Fin, "r")
  okPAS={}
  for ind, ln in enumerate(finNuc):
    if ind >=1:
      chrom,start, end, name, score, strand, pctAT, pctGC, A, C, G, T, N, Other, Length, Sequence = ln.split()
      seqUpper=Sequence.upper()
      string="T" * int(filtnum)
      #print(string)
      if string not in seqUpper:
          if int(T)/int(Length) < .7:
              okPAS[name]=""
              #print(name)
  for i,ln in enumerate(inSAF):
      if i>0:
          name=ln.split()[0]
          #print(name)
          if name in okPAS.keys():
              outSAF.write(ln)
  outSAF.close()


if __name__ == "__main__":
      import sys
      inFile = sys.argv[1]
      inSAF= sys.argv[2]
      outSAF=sys.argv[3]
      nfilt=sys.argv[4]
      main(inFile,inSAF, outSAF, nfilt)
