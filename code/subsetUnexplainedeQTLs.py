eQTLS_intot="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inTot.txt"
Unexp_eQTLS_intot="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inTot.txt"
eQTLS_innuc="../data/overlapeQTLs/permRes_eQTLs_GeneNames_inNuc.txt"

Unexp_eQTLS_innuc="../data/overlapeQTLs/permRes_Unexplained_eQTLs_GeneNames_inNuc.txt"


def subsetQTL(inQTL, unexQTL):
    ungenes={}
    for ln in open("/project2/gilad/briana/threeprimeseq/data/eQTL_Lietal/unexplained_FDR10_GENEnames.txt","r"):
        gene=ln.strip()
        ungenes[gene]=""
    fout=open(unexQTL, "w")
    for ln in open(inQTL, "r"):
        egene=ln.split()[0]
        if egene in ungenes.keys():
            fout.write(ln)
    fout.close()

subsetQTL(eQTLS_intot,Unexp_eQTLS_intot)
subsetQTL(eQTLS_innuc,Unexp_eQTLS_innuc)
