fout = open("../data/phenotype/SAMPLE.txt",'w')

for ln in open("../data/peakCoverage/file_id_mapping_Total_Transcript.txt", "r"):
    bam, sample = ln.split("\t")
    line=sample[:-3]
    fout.write("NA"+line + "\n")
fout.close()
