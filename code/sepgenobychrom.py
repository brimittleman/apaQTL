
def main(target, outFile):
    fout=open(outFile,"w")
    infile=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf","r")
    for i, ln in enumerate(infile):
      if i==0:
          fout.write(ln)
      else:
          targetSTR=str(target)
          chrom=ln.split()[0]
          if chrom == targetSTR:
              fout.write(ln)
    fout.close()


if __name__ == "__main__":
  import sys
  target =sys.argv[1]
  outFile="/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr%s.vcf"%(target)
  main(target,outFile)
