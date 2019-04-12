library(tidyverse)
library(reshape2)
library(optparse)

option_list = list(
    make_option(c("-P", "--pheno"), action="store", default=NA, type='character', help="peakPheno"),
    make_option(c("-N", "--numeric"), action="store", default=NA, type='character', help="numeric pheno"),
    make_option(c("-O", "--output"), action="store", default=NA, type='character', help="numeric pheno out ")
)

opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


totalPeakUs=read.table(opt$pheno, header = T, stringsAsFactors = F) %>% separate(chrom, sep = ":", into = c("chr", "start", "end", "id")) %>% separate(id, sep="_", into=c("gene", "strand", "peak"))


ind=colnames(totalPeakUs)[7:dim(totalPeakUs)[2]]
totalPeakUs_CountNum=read.table(opt$numeric, col.names = ind)


#numeric with anno
totalPeak=as.data.frame(cbind(totalPeakUs[,1:6], totalPeakUs_CountNum))


#mean
totalPeakUs_CountNum_mean=rowMeans(totalPeakUs_CountNum)



#append mean to anno
TotalPeakUSMean=as.data.frame(cbind(totalPeakUs[,1:6],totalPeakUs_CountNum_mean))


TotalPeakUSMean_5per= TotalPeakUSMean %>% filter(totalPeakUs_CountNum_mean>=.05)
write.table(TotalPeakUSMean_5per,file=opt$output, row.names=F, col.names=F, quote = F)
