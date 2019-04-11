def main(Bamin, out):
    okRead={}
    #pysam to read in bam allignments
    bamfile = pysam.AlignmentFile(Bamin, "rb")
    finalBam =  pysam.AlignmentFile(out, "wb", template=bamfile)
    n=0
    k=0
    #read name is the first col in each bam file
    for read in bamfile.fetch():
        #last piece is always the right piece  
        #vw=read.split(\t)[-1]
        if read.has_tag('vW'):
            x= read.get_tag('vW')
            print(x)
            if x == 1:
                k+=1
                finalBam.write(read)
            else:
                n+=1
                continue
        else:
          finalBam.write(read)
  
    print("with wv" + n)
    print("pass filter" + k)
    bamfile.close()
    finalBam.close()
    
    
    
if __name__ == "__main__":
    import sys, pysam
    inBam=sys.argv[1]
    outBam=sys.argv[2]
    main(inBam, outBam)
