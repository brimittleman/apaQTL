


def main(inFile, outFile):
    geneNames=open("/project2/gilad/briana/genome_anotation_data/ensemble_to_genename.txt","r")
    name_dic={}
    for i,ln in enumerate(geneNames):
      if i >0:
          id, name, source =ln.split("\t")
          name_dic[id]=name
    nNot=0
    fout=open(outFile, "w")
    for ln in open(inFile, "r"):
        line_list=ln.split()
        if len(line_list)==3:
            chrom=line_list[0][3:]
            snp=line_list[1]
            geneid=ln.split()[2]
            if geneid in name_dic.keys():
                genename=name_dic[geneid]
                fout.write("%s\t%s\t%s\n"%(chrom, snp, genename))
            else:
                nNot+=1
        else:
            geneList=line_list[2:]
            chrom=line_list[0][3:]
            snp=line_list[1]
            for each in geneList:
                if each in name_dic.keys():
                    if geneid in name_dic.keys():
                        genename=name_dic[geneid]
                        fout.write("%s\t%s\t%s\n"%(chrom, snp, genename))
                    else:
                        nNot+=1
    print(nNot)
    fout.close()



if __name__ == "__main__":
    import sys
    inQTL =sys.argv[1]
    outFile= sys.argv[2]
    main(inQTL, outFile)
