def main(inFile, outF):
    outFile=open(outF, "w")
    outFile.write("GeneID\tChr\tStart\tEnd\tStrand\n")
    for ln in open(inFile, "r"):
        chrom, start, end, peak, cov, strand, score, anno = ln.split()
        if anno==".":
            continue
        anno_lst=anno.split(",")
        if len(anno_lst)==1:
            gene=anno_lst[0].split(":")[1]
            loc=anno_lst[0].split(":")[0]
            print("1 gene")
            peak_i=int(peak)
            start_i=int(start)
            end_i=int(end)
            ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene, loc)
            outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
        else:
            type_dic={}
            for each in anno_lst:
                type_dic[each.split(":")[0]]=each.split(":")[1]
            if "utr3" in type_dic.keys():
                gene=type_dic["utr3"]
                loc="utr3"
                peak_i=int(peak)
                start_i=int(start)
                end_i=int(end)
                ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene,loc)
                outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
                #continue
            elif "end" in type_dic.keys():
                gene=type_dic["end"]
                loc="end"
                peak_i=int(peak)
                start_i=int(start)
                end_i=int(end)
                ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene,loc)
                outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
                #continue
            elif "cds" in type_dic.keys():
                gene=type_dic["cds"]
                loc="cds"
                peak_i=int(peak)
                start_i=int(start)
                end_i=int(end)
                ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene,loc)
                outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
                #continue
            elif "utr5" in type_dic.keys():
                gene=type_dic["utr5"]
                loc="utr5"
                peak_i=int(peak)
                start_i=int(start)
                end_i=int(end)
                ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene,loc)
                outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
                #continue
            elif "intron" in type_dic.keys():
                gene=type_dic["intron"]
                loc="intron"
                peak_i=int(peak)
                start_i=int(start)
                end_i=int(end)
                ID="peak%d:%s:%d:%d:%s:%s_%s"%(peak_i, chrom, start_i, end_i, strand, gene,loc)
                outFile.write("%s\t%s\t%d\t%d\t%s\n"%(ID, chrom, start_i, end_i, strand))
                #continue
            #else:
                #continue
    outFile.close()


if __name__ == "__main__":
    import numpy as np
    from misc_helper import *
    import sys
    infile =sys.argv[1]
    outfile= sys.argv[2]
    main(infile, outfile)
