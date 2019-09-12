#Fraction=$1
#gene=$2
#chrom=$3
#snp=$4


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
            gene=ln.split()[0].split(":")[-1].split("_")[0]
            chrom=ln.split()[0].split(":")[0]
            snp=ln.split()[5]
            fout.write("sbatch run_pttfacetboxplot.sh %s %s %s %s \n"%(fraction, gene, chrom, snp))
    fout.close()


if __name__ == "__main__":
    import sys
    fraction= sys.argv[1]
    if fraction=="Total":
      QTLs="../data/pttQTL/TotalPttQTL.txt"
      outfile="Script4TotalPTTqtlexamples.sh"
    else:
      QTLs="../data/pttQTL/NuclearPttQTL.txt"
      outfile="Script4NuclearPTTqtlexamples.sh"
    main(fraction,QTLs, outfile)
