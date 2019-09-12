fin=open("../data/SNPinSS/PASregion_PASandSNPs.txt","r")
fout=open("../data/SNPinSS/PASregion_PASandSNPs.FIXED.txt", 'w')


for ln in fin:
   pas, snp = ln.split()
   snp_list=snp.split(",")
   if len(snp_list)==1:
       fout.write(ln)
   else:
       for i in snp_list:
           fout.write("%s\t%s\n"%(pas,i))

fout.close()



fin2=open("../data/SNPinSS/Otherregions_PASandSNPs.txt","r")
fout2=open("../data/SNPinSS/Otherregions_PASandSNPs.FIXED.txt", 'w')


for ln in fin2:
   pas, snp = ln.split()
   snp_list=snp.split(",")
   if len(snp_list)==1:
       fout2.write(ln)
   else:
       for i in snp_list:
           fout2.write("%s\t%s\n"%(pas,i))

fout2.close()
