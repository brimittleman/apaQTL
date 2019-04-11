#!/usr/bin/env python


def main(Bin, Bamin, out):
    okRead={}
    for ln in open(Bin, "r"):
        chrom, start_new , end_new , name, score, strand = ln.split()
        okRead[name] = ""
    #pysam to read in bam allignments
    bamfile = pysam.AlignmentFile(Bamin, "rb")
    finalBam =  pysam.AlignmentFile(out, "wb", template=bamfile)
    #read name is the first col in each bam file
    n=0
    for read in bamfile.fetch():
        read_name=read.query_name
        #if statement about name  
        if read_name in okRead.keys():
            finalBam.write(read)
        if n % 1000==0 : print(n)
        n+=1 
    bamfile.close()
    finalBam.close()

    
if __name__ == "__main__":
    import sys, pysam
    inBed= sys.argv[1]
    inBam=sys.argv[2]
    outBam=sys.argv[3]
    main(inBed, inBam, outBam)
