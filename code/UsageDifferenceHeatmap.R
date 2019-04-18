library(reshape2)
library(tidyverse)
library(optparse)

option_list = list(
  make_option(c("-F", "--fraction"), action="store", default=NA, type='character', help="Fraction to run analysis")
  
)

opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)


##input files:  
PeakAnno=read.table(paste("../data/phenotype/APApeak_Phenotype_GeneLocAnno.", opt$fraction, ".fc", sep=""), header = T)
indiv=colnames(PeakAnno)[2:length(col.names(PeakAnno))]
NumericUsage=read.table(paste("../data/phenotype/APApeak_Phenotype_GeneLocAnno.", opt$fraction, ".CountsOnlyNumeric", sep=""), col.names = indiv)
filterPheno=read.table(paste("../data/phenotype_5perc/.", opt$fraction, ".5perc.fc", sep=""), header=T)
counts=read.table(paste("../data/peakCoverage/APAPeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.", opt$fraction, ".Quant.Fixed.fc", sep=""), col.names = c("GeneID", "Chr", "Start","End", "Strand", "Length", indiv)) 

##combine peak anno and numeric usage and filter by peaks in 5 perc 
PeakUsage=as.data.frame(cbind(PeakAnno, NumericUsage)) %>% semi_join(filterPheno, by="chrom")

##find genes with 2 peaks:  
genes2Peaks=PeakUsage %>% separate(chrom, into=c("chromo", 'start', 'end', "peakID"), sep = ":") %>% separate(peakID, into=c("gene", "loc", "strand", "peaknum"),sep="_") %>% group_by(gene) %>% summarise(nPeaks=n()) %>% filter(nPeaks==2)

#filter to these genes:  
PeakUsage2peaks= PeakUsage %>% separate(chrom, into=c("chromo", 'start', 'end', "peakID"), sep = ":") %>% separate(peakID, into=c("gene", "loc", "strand", "peaknum"),sep="_") %>% semi_join(genes2Peaks, by="gene") %>% select(-chromo, -start, -end, -loc, -strand, -peaknum)

#filter counts to genes in the 2 peak set (I am not filtering on 5% peaks here as well)
counts_filt= counts %>% separate(Geneid, into=c("peaknum", "chromP", "startP", "endP", "strandP","peakID"), sep=":") %>% separate(peakID, into=c("gene", "loc"),sep="_") %>% select(-loc, -Chr, -Start, -End, -Strand, -Length, -peaknum, -chromP, -startP, -endP, -strandP) %>% semi_join(genes2Peaks, by="gene")

#function to give me output of final matrix  

perIndDiffUsage=function(ind, counts=counts_filt, usage=PeakUsage2peaks){
  ind=enquo(ind)
  #compute usage stats
  #seperate usage
  usage_ind=usage %>% select(gene, !!ind) 
  usage_other = usage %>% select(-gene,-!!ind) %>% rowMeans()
  usage_indVal=as.data.frame(cbind(usage_ind,usage_other))
  usage_indVal$val=abs(usage_indVal[,2] - usage_indVal[,3])
  usage_indVal2= usage_indVal%>% group_by(gene) %>% select(gene, val) %>% distinct(gene, .keep_all=T) 
  #seperate genes by percentile for this ind
  count_ind= counts %>% select(gene, !!ind)
  colnames(count_ind)=c("gene", "count")
  count_ind = count_ind %>%  group_by(gene) %>% summarize(Exp=sum(count)) %>% filter(Exp >0)  %>% mutate(Percentile = percent_rank(Exp)) 
  count_ind_perc10= count_ind %>% filter(Percentile<.1)
  count_ind_perc20= count_ind %>% filter(Percentile<.2, Percentile>.1)
  count_ind_perc30= count_ind %>% filter(Percentile<.3, Percentile>.2)
  count_ind_perc40= count_ind %>% filter(Percentile<.4, Percentile>.3)
  count_ind_perc50= count_ind %>% filter(Percentile<.5, Percentile>.4)
  count_ind_perc60= count_ind %>% filter(Percentile<.6, Percentile>.5)
  count_ind_perc70= count_ind %>% filter(Percentile<.7, Percentile>.6)
  count_ind_perc80= count_ind %>% filter(Percentile<.8, Percentile>.7)
  count_ind_perc90= count_ind %>% filter(Percentile<.9, Percentile>.8)
  count_ind_perc100= count_ind %>% filter(Percentile<1, Percentile>.9)
  #subset and sum usage 
  out10_df= usage_indVal2 %>% inner_join(count_ind_perc10, by="gene")
  out20_df= usage_indVal2 %>% inner_join(count_ind_perc20, by="gene")
  out30_df= usage_indVal2 %>% inner_join(count_ind_perc30, by="gene")
  out40_df= usage_indVal2 %>% inner_join(count_ind_perc40, by="gene")
  out50_df= usage_indVal2 %>% inner_join(count_ind_perc50, by="gene")
  out60_df= usage_indVal2 %>% inner_join(count_ind_perc60, by="gene")
  out70_df= usage_indVal2 %>% inner_join(count_ind_perc70, by="gene")
  out80_df= usage_indVal2 %>% inner_join(count_ind_perc80, by="gene")
  out90_df= usage_indVal2 %>% inner_join(count_ind_perc90, by="gene")
  out100_df= usage_indVal2 %>% inner_join(count_ind_perc100, by="gene")
  #output list of 10 values
  out= c((sum(out10_df$val)/nrow(out10_df)), (sum(out20_df$val)/nrow(out20_df)), (sum(out30_df$val)/nrow(out30_df)), (sum(out40_df$val)/nrow(out40_df)), (sum(out50_df$val)/nrow(out50_df)), (sum(out60_df$val)/nrow(out60_df)), (sum(out70_df$val)/nrow(out70_df)), (sum(out80_df$val)/nrow(out80_df)), (sum(out90_df$val)/nrow(out90_df)), (sum(out100_df$val)/nrow(out100_df)))
  return(out)
}

#Run this over all individuals at each percentile:  

Percentile=c(10,20,30,40,50,60,70,80,90,100)
for (i in indiv){
  x= perIndDiffUsage(i)
  Percentile=cbind(Percentile, x)
}
colnames(Percentile)=c("Percentile", indiv)

#melt this to make a ggplot: 
Percentile_melt=melt(Percentile_df, id.vars=c("Percentile"))
colnames(Percentile_melt)=c("Percentile", "Individual", "AvgUsageDiff")


diffplot=ggplot(Percentile_melt, aes(x=Percentile, y=Individual, fill=AvgUsageDiff)) + geom_tile() + labs(title="Average peak usage difference for individaul vs. others") + scale_fill_gradientn(colours = c("white", "blue", "black"))

ggsave(diffplot,file=paste("../output/AverageDiffHeatmap.", opt$fraction, ".png", sep=""))


