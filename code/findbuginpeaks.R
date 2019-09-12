Oldpeaks=read.table("../threeprimeseq/data/phenotypes_filtPeakTranscript_noMP_GeneLocAnno/filtered_APApeaks_merged_allchrom_refseqGenes.GeneLocAnno_NoMP_sm_quant.Total.fixed.pheno.fc",header=T)%>% select(chrom) %>% separate(chrom, into=c("chr", "start", "end", "peak"), sep=":") %>% mutate(length=as.numeric(end)-as.numeric(start))


Newpeaks=read.table("data/phenotype/APApeak_Phenotype_GeneLocAnno.Total.fc", header=T, stringsAsFactors = F)%>% select(chrom) %>% separate(chrom, into=c("chr", "start", "end", "peak"), sep=":") %>% mutate(length=as.numeric(end)-as.numeric(start))



par(mfrow=c(2,2))
hist(log10(Oldpeaks$length))
boxplot(log10(Oldpeaks$length))
hist(log10(Newpeaks$length))
boxplot(log10(Newpeaks$length))


oldcount=read.table("../threeprimeseq/data/phenotypes_filtPeakTranscript_noMP_GeneLocAnno/filtered_APApeaks_merged_allchrom_refseqGenes.GeneLocAnno_NoMP_sm_quant.Nuclear.fixed.pheno.CountsOnlyNumeric.txt")
