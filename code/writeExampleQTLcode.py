#Fraction=$1
#gene=$2
#chrom=$3
#snp=$4
#peakID=$5


def main(fraction, QTLs,outfile):
    fout=open(outfile, "w")
    fout.write("#!/bin/bash\n\n\n")
    fout.write("#SBATCH --job-name=%s_example\n"%(fraction))
    fout.write("#SBATCH --account=pi-yangili1\n")
    fout.write("#SBATCH --output=%s_example.out\n"%(fraction))
    fout.write("#SBATCH --error=%s_example.err\n"%(fraction))
    fout.write("#SBATCH --partition=broadwl\n")
    fout.write("#SBATCH --mem=12G\n\n\n\n")
    qtlfile=open(QTLs, "r")
    for i, ln in enumerate(qtlfile):
        if i>0:
            gene=ln.split()[3]
            chrom=ln.split()[0]
            snp=ln.split()[11]
            peakID=ln.split()[6]
            fout.write("sbatch run_qtlFacetBoxplots.sh %s %s %s %s %s \n"%(fraction, gene, chrom, snp, peakID))
    fout.close()


if __name__ == "__main__":
    import sys
    fraction= sys.argv[1]
    if fraction=="Total":
      QTLs="../data/apaQTLs/Total_apaQTLs4pc_5fdr.txt"
      outfile="Script4TotalQTLexamples.sh"
    else:
      QTLs="../data/apaQTLs/Nuclear_apaQTLs4pc_5fdr.txt"
      outfile="Script4NuclearQTLexamples.sh"
    main(fraction,QTLs, outfile)
