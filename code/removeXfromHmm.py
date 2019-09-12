infile=open("/project2/gilad/briana/genome_anotation_data/GM12878.chromHMM.sort.bed", "r")
fout=open("/project2/gilad/briana/genome_anotation_data/GM12878.chromHMM.NoSexChrom.bed", "w")

fout.write("chrom\tstart\tend\tHMMcat\tscore\tstrand\n")

for ln in infile:
    chrom, start, end, lab, score, strand= ln.split()
    if chrom != "X":
        fout.write(ln)
fout.close()
