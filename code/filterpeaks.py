
def main(inFile, outFile):
    fout = open(outFile,'w')
    #cutoffs
    c = 0.9
    caveread = 2

    # counters
    fc, fcaveread = 0, 0
    N, Npass = 0, 0
    for dic in stream_table(open(inFile),'\t'):
        tot, nuc = [], []
        for k in dic:
            if "YL-SP" not in k: continue
            T = k.split("-")[-3].split("_")[0]
            if T == "T":
                tot.append(int(dic[k]))
            else:
                nuc.append(int(dic[k]))
        totP = tot.count(0)/float(len(tot))
        nucP = nuc.count(0)/float(len(nuc))
        N += 1
        if totP > c and nucP > c:
            fc += 1
            continue
        if max([np.mean(tot),np.mean(nuc)]) <= caveread:
            fcaveread += 1
            continue

        fout.write("\t".join(["chr"+dic['Chr'], dic["Start"], dic["End"],str(max([np.mean(tot),np.mean(nuc)])),dic["Strand"],"."])+'\n')
        Npass += 1
    fout.close()
    print("%d (%.2f%%) did not pass proportion of nonzero cutoff, %d (%.2f%%) did not pass average read cutoff. Total peaks: %d (%.3f%%) of %d peaks remaining"%(fc,float(fc)/N*100, fcaveread, float(fcaveread)/N*100, Npass, 100*Npass/float(N),N))



if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys
    inFile =sys.argv[1]
    outFile= sys.argv[2]
    main(inFile, outFile)
