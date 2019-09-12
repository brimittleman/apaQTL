library(tidyverse)
library(reshape2)
library(optparse)
library(cowplot)


option_list = list(
  make_option(c("-F", "--fraction"), action="store", default=NA, type='character',
              help="input fraction"),
  make_option(c("-G", "--geno"), action="store", default=NA, type='character',
              help="input genotype"),
  make_option(c("-g", "--gene"), action="store", default=NA, type='character',
              help="gene"),
  make_option(c("-o", "--output"), action="store", default=NA, type='character',
              help="output file for plot")
)

opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


geno_head=read.table("../data/pttQTLplots/genoHead.txt", header =T,stringsAsFactors = F)
geno=read.table(opt$geno, col.names =colnames(geno_head),stringsAsFactors = F)%>% select(ID,contains("NA"))

lettersGeno=read.table(opt$geno, col.names =colnames(geno_head),colClasses = c("character"),stringsAsFactors = F) %>% select(REF, ALT)


refAllele=as.character(lettersGeno$REF)
altAllele=as.character(lettersGeno$ALT)

genoMelt=melt(geno, id.vars = "ID", value.name = "FullGeno", variable.name = "Individual" ) %>% select(Individual, FullGeno) %>% mutate(genotype=ifelse(round(as.integer(FullGeno))==0, paste(refAllele, refAllele, sep=""), ifelse(round(as.integer(FullGeno))==1, paste(refAllele,altAllele, sep=""), paste(altAllele,altAllele,sep=""))))


pheno=read.table(paste("../data/pttQTLplots/",opt$fraction,"Phenotype.txt",sep=""), header=T, stringsAsFactors=F)


pheno_gene=pheno %>% filter(gene==opt$gene) %>% inner_join(genoMelt, by="Individual")



qtlplot=ggplot(pheno_gene,aes(x=genotype, y=ratio, fill=genotype)) +  geom_boxplot(width=.5)+ geom_jitter(alpha=1) + labs(y="Intronic PAS usage Ratio", title=paste(opt$fraction, opt$gene, sep="   ")) + scale_fill_brewer(palette = "Dark2")

ggsave(plot=qtlplot, filename=opt$output, height=10, width=10)
