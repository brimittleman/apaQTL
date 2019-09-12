library(tidyverse)
library(reshape2)
library(optparse)
library(cowplot)


option_list = list(
  make_option(c("-P", "--pheno"), action="store", default=NA, type='character',
              help="input pheno file"),
  make_option(c("-G", "--geno"), action="store", default=NA, type='character',
              help="input genotype"),
  make_option(c("-g", "--gene"), action="store", default=NA, type='character',
              help="gene"),
  make_option(c("-p", "--peakID"), action="store", default=NA, type='character',
              help="peakID"),
  make_option(c("-o", "--output"), action="store", default=NA, type='character',
              help="output file for plot")
)

opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


phenohead=read.table("/project2/gilad/briana/apaQTL/data/ExampleQTLPlots/phenotypeHeader.txt", header = T,stringsAsFactors = F)
pheno=read.table(opt$pheno, col.names =colnames(phenohead),stringsAsFactors = F)


meltpheno=melt(pheno, id.vars = "chrom", value.name = "Ratio", variable.name = "Individual") %>% separate(Ratio, into=c("num", "denom"), sep="/")  %>%   separate(chrom, into=c("chrom", "start", "end", "peakID"),sep=":") %>% mutate(PeakLoc=paste(start, end, sep=":"))

meltpheno$Individual= as.character(meltpheno$Individual)
meltpheno$num= as.numeric(meltpheno$num)
meltpheno$denom=as.numeric(meltpheno$denom)


genoHead=read.table("/project2/gilad/briana/apaQTL/data/ExampleQTLPlots/genotypeHeader.txt", header = T,stringsAsFactors = F)
geno=read.table(opt$geno, col.names =colnames(genoHead),stringsAsFactors = F ) %>% select(ID,contains("NA")) 


lettersGeno=read.table(opt$geno, col.names =colnames(genoHead),stringsAsFactors = F,colClasses = c("character")) %>% select(REF, ALT)

refAllele=lettersGeno$REF
altAllele=lettersGeno$ALT


genoMelt=melt(geno, id.vars = "ID", value.name = "FullGeno", variable.name = "Individual" ) %>% select(Individual, geno) %>% mutate(genotype=ifelse(round(as.integer(geno))==0, paste(refAllele, refAllele, sep=""), ifelse(round(as.integer(geno))==1, paste(refAllele,altAllele, sep=""), paste(altAllele,altAllele,sep=""))))
genoMelt$Individual= as.character(genoMelt$Individual)


pheno_qtlpeak=meltpheno %>% inner_join(genoMelt, by="Individual") %>%  mutate(PAU=num/denom) 

qtlplot=ggplot(pheno_qtlpeak, aes(x=genotype, y=PAU, fill=genotype)) + geom_boxplot(width=.5)+ geom_jitter(alpha=1) + facet_grid(~PeakLoc) +scale_fill_brewer(palette = "YlOrRd")

ggsave(plot=qtlplot, filename=opt$output, height=10, width=10)
