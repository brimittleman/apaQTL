library(tidyverse)

geneNames=read.table("../../genome_anotation_data/ensemble_to_genename.txt", sep="\t", col.names = c('gene_id', 'GeneName', 'source' ),stringsAsFactors = F)
results=read.table("../data/eQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.out", stringsAsFactors = F, col.names = c("longGenename", "SNP", "dist", "pval", "slope"))
results$bh=p.adjust(results$pval, method="fdr")

sig=results %>% filter(-log10(bh)>=1) %>% mutate(gene_id=substr(longGenename, 1, nchar(longGenename)-2))%>% inner_join(geneNames, by="gene_id") %>% select(GeneName, SNP, dist, pval, slope, bh)

write.table(sig, file="../data/eQTLs/SignificanteQTLS10fdr.genenames.txt", col.names=F, row.names=F, sep="\t")
