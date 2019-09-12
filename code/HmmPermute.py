
def main(qtls, HmmresFile):
    fout=open(HmmresFile, "w")
    hmmdf=pd.read_csv("/project2/gilad/briana/genome_anotation_data/GM12878.chromHMM.NoSexChrom.bed",sep="\t")
    hmmdf_sort=hmmdf.sort_values(by=["chrom", "start"])
    hmm=pybedtools.BedTool.from_dataframe(hmmdf_sort)
    QTLs=pd.read_csv(qtls,sep='\t')
    resDic={}
    for i in range(15):
        resDic[i+1]=[]
    for i in range(1000):
        samp=QTLs.sample(frac=1, replace=True)
        samp_sort=samp.sort_values(by=["SNPchr", "SNPstart"])
        sampBed=pybedtools.BedTool.from_dataframe(samp_sort)
        overlap=sampBed.intersect(hmm, wa=True,wb=True )
        results=overlap.to_dataframe()
        print(results)
        #results.columns=["chr", "start", "end", "peak", "slope", "strand","chrom2", "start2", "ex","end2" "hmmcat", "score2", "strand2"]
        results["blockCount"] = results["blockCount"].apply(pd.to_numeric, errors='coerce')
        #print(results)
        for i in range(15):
            cat=i+1
            catstr=str(cat)
            newval=len(results[results['blockCount'] == cat])
            resDic[cat].append(newval)
    print(resDic)
    for key,value in resDic.items():
            val_list=[]
            for i in value:
                val_list.append(str(i))
            valstr="\t".join(val_list)
            fout.write("%s\t%s\n"%(key,valstr))
    fout.close()


if __name__ == "__main__":
    import numpy as np
    import pandas as pd
    import pybedtools
    import sys
    inQTLbed =sys.argv[1]
    outFile= sys.argv[2]
    main(inQTLbed, outFile)
