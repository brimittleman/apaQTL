#vcf2bed


def main(inVCF, outBed):
    fout=open(outBed,"w")
    for ln in open(inVCF):
        if ln.startswith("#") == False:
            if ln.startswith("CHROM")==False:
                chrom=ln.split()[0]
                pos=ln.split()[1]
                start=int(pos)-1
                name=ln.split()[2]
                score="."
                strand="."
                fout.write("%s\t%s\t%s\t%s\t%s\t%s\n"%(chrom, start, pos, name,score,strand))
    fout.close()


if __name__ == "__main__":
    import sys
    vcf = sys.argv[1]
    outfile= sys.argv[2]
    main(vcf, outfile)
