def main(inFile, outFile, ctarget):
    fout = open(outFile,'w')
    mincount = 10
    ov = 20
    current_peak = []

    currentChrom = None
    prevPos = 0
    for ln in open(inFile):
        chrom, pos, count = ln.split()
        if chrom != ctarget: continue
        count = float(count)

        if currentChrom == None:
            currentChrom = chrom

        if count == 0 or currentChrom != chrom or int(pos) > prevPos + 1:
            if len(current_peak) > 0:
                print (current_peak)
                M = max([x[1] for x in current_peak])
                if M > mincount:
                    all_peaks = refine_peak(current_peak, M, M*0.1,M*0.05)
                    #refined_peaks = [(x[0][0],x[-1][0], np.mean([y[1] for y in x])) for x in all_peaks]
                    rpeaks = [(int(x[0][0])-ov,int(x[-1][0])+ov, np.mean([y[1] for y in x])) for x in all_peaks]
                    if len(rpeaks) > 1:
                        for clu in cluster_intervals(rpeaks)[0]:
                            M = max([x[2] for x in clu])
                            merging = []
                            for x in clu:
                                if x[2] > M *0.5:
                                    #print x, M
                                    merging.append(x)
                            c, s,e,mean =  chrom, min([x[0] for x in merging])+ov, max([x[1] for x in merging])-ov, np.mean([x[2] for x in merging])
                            #print c,s,e,mean
                            fout.write("chr%s\t%d\t%d\t%d\t+\t.\n"%(c,s,e,mean))
                            fout.flush()
                    elif len(rpeaks) == 1:
                        s,e,mean = rpeaks[0]
                        fout.write("chr%s\t%d\t%d\t%f\t+\t.\n"%(chrom,s+ov,e-ov,mean))
                        print("chr%s"%chrom+"\t%d\t%d\t%f\t+\t.\n"%rpeaks[0])
                    #print refined_peaks
            current_peak = [(pos,count)]
        else:
            current_peak.append((pos,count))
        currentChrom = chrom
        prevPos = int(pos)

def refine_peak(current_peak, M, thresh, noise, minpeaksize=30):

    cpeak = []
    opeak = []
    allcpeaks = []
    allopeaks = []

    for pos, count in current_peak:
        if count > thresh:
            cpeak.append((pos,count))
            opeak = []
            continue
        elif count > noise:
            opeak.append((pos,count))
        else:
            if len(opeak) > minpeaksize:
                allopeaks.append(opeak)
            opeak = []

        if len(cpeak) > minpeaksize:
            allcpeaks.append(cpeak)
            cpeak = []

    if len(cpeak) > minpeaksize:
        allcpeaks.append(cpeak)
    if len(opeak) > minpeaksize:
        allopeaks.append(opeak)

    allpeaks = allcpeaks
    for opeak in allopeaks:
        M = max([x[1] for x in opeak])
        allpeaks += refine_peak(opeak, M, M*0.3, noise)

    #print [(x[0],x[-1]) for x in allcpeaks], [(x[0],x[-1]) for x in allopeaks], [(x[0],x[-1]) for x in allpeaks]
    #print '---\n'
    return(allpeaks)

if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys

    chrom = sys.argv[1]
    inFile =sys.argv[2]
    outFile= sys.argv[3]
    main(inFile, outFile, chrom)
