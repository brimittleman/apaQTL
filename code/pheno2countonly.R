library(reshape2)
library(tidyverse)
library(optparse)

option_list = list(
    make_option(c("-I", "--input"), action="store", default=NA, type='character', help="peakPheno"),
    make_option(c("-O", "--output"), action="store", default=NA, type='character', help="peakPheno output only numbers")
)

opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


totalPeakUs=read.table(opt$input, header = T, stringsAsFactors = F) %>% separate(chrom, sep = ":", into = c("chr", "start", "end", "id")) %>% separate(id, sep="_", into=c("gene", "strand", "peak"))



write.table(totalPeakUs[,7:dim(totalPeakUs)[2]], file=opt$output, quote=FALSE, col.names = F, row.names = F)
