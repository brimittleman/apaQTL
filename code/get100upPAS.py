
def main(Fin, Fout):
  outBed=open(Fout, "w")
  chrom_lengths=open("/project2/gilad/briana/genome_anotation_data/chrom_lengths2.sort.bed","r")
  #make a dictionary with chrom lengths
  length_dic={}
  for i in chrom_lengths:
    chrom, start, end = i.split()
    length_dic[str(chrom)]=int(end)  

#write file 
  for ln in open(Fin):
    chrom, start, end, name, score, strand = ln.split()
    chrom=str(chrom)
    if strand=="+":
      start_new=int(end)-100
      if start_new <= 1:
        start_new = 0 
      end_new= int(end)
      if end_new == 0:
        end_new=1
      outBed.write("%s\t%d\t%d\t%s\t%s\t%s\n"%(chrom, start_new, end_new, name, score, strand))
    if strand == "-":
      start_new=int(start)
      end_new=int(start) + 100
      outBed.write("%s\t%d\t%d\t%s\t%s\t%s\n"%(chrom, start_new, end_new, name, score, strand))
  outBed.close()  

if __name__ == "__main__":
    import sys
    inFile = sys.argv[1]
    outFile=sys.argv[2] 
    main(inFile, outFile)
