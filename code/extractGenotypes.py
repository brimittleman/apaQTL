

#this script takes in  a qtl file and returns a file with the genotypes for each of the snps in the file



def main(qtls, outFile):
    #open outFile
    fout=open(outFile, "w")
    #make dictionary with snps
    snp_dic={}
    for ln in open(qtls, "r"):
        snp= ln.split()[11]
        if snp not in snp_dic.keys():
            snp_dic[snp]=""
    #loop through vcf and process relevent snps
    for ln in open("/project2/gilad/briana/YRI_geno_hg19/allChrom.dose.filt.vcf"):
        if ln.startswith("#") == False:
            snp=ln.split()[2]
            if snp in snp_dic.keys():
                parseGeno=[snp]
                genolist=ln.split()[9:]
                #print(len(genolist))
                #0|0:0.547:0.480
                for i in genolist:
                    geno=i.split(":")[0]
                    alleles=geno.split("|")
                    dose= int(alleles[0]) + int(alleles[1])
                    parseGeno.append(str(dose))
                #print(parseGeno)
                #print(len(parseGeno))
                fout.write("\t".join(parseGeno))
                fout.write("\n")
    fout.close()

if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys
    uniqFile =sys.argv[1]
    outFile= sys.argv[2]
    main(uniqFile, outFile)
