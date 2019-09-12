infile=open("/project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf","r")
fout=open("/project2/gilad/briana/li_genotypes/RSID2snploc.txt","w")

fout.write("snp\tRSID\tRef\tAlt\n")

for i, ln in enumerate(infile):
    if i >0:
        chrom=ln.split()[0]
        loc=ln.split()[1]
        newloc=str(chrom) + ":" + str(loc)
        rsid=ln.split()[2]
        ref=ln.split()[3]
        alt=ln.split()[4]
        fout.write("%s\t%s\t%s\t%s\n"%(newloc, rsid, ref, alt))
fout.close()
