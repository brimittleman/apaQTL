#!/bin/rscripts

# usage: Rscirpt --vanilla  filterSortBedbyCleanedBed_gen.R bedfile cleannuc outfile

#this script takes in the sorted bed file and the clean reads, it will clean the bed file   


library(dplyr)
library(tidyr)
library(data.table)


args = commandArgs(trailingOnly=TRUE)
bed=args[1]
clean= args[2]
output=args[3]


bedFile=fread(bed, col.names = c("Chrom", "start", "end", "name", "score", "strand"))

cleanFile=fread(clean, col.names = c("Chrom", "start", "end", "name", "score", "strand"))

intersection=bedFile %>% semi_join(cleanFile, by="name")

fwrite(intersection, file=output,quote = F, col.names = F, row.names = F, sep="\t")
