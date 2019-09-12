
def main(ptt, nomapa, outQTL, outNot):
     qtldic={}
     pttqtl=open(ptt,"r")
     for i, ln in enumerate(pttqtl):
         if i>0:
             gene=ln.split()[0].split(":")[-1].split("_")[0]
             if gene not in qtldic.keys():
                 qtldic[gene]=""

     outYes=open(outQTL,"w")
     outNo=open(outNot,"w")
     apa=open(nomapa, "r")
     for i,ln in enumerate(apa):
         if i >0:
             gene=ln.split()[0].split(":")[-1].split("_")[0]
             if gene in qtldic.keys():
                     outYes.write(ln)
             else:
                 outNo.write(ln)
     outYes.close()
     outNo.close()


if __name__ == "__main__":
    from misc_helper import *
    import sys
    fraction =sys.argv[1]
    if fraction=="Total":
        ptt="../data/pttQTL/TotalPttQTL.txt"
        nomFile="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Total_permResBH.txt"
        OutQTL="../data/pttQTL/Totalapa_TotalPttQTL.txt"
        OutNot="../data/pttQTL/Totalapa_NOT_TotalPttQTL.txt"
    else:
        ptt="../data/pttQTL/NuclearPttQTL.txt"
        nomFile="../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear_permResBH.txt"
        OutQTL="../data/pttQTL/Nuclearapa_NuclearPttQTL.txt"
        OutNot="../data/pttQTL/Nuclearapa_NOT_NuclearPttQTL.txt"
    main(ptt,nomFile,OutQTL,OutNot)
