library(dplyr)


##total results
tot.perm= read.table("../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Total_permRes.txt",head=F, stringsAsFactors=F, col.names = c("pid", "nvar", "shape1", "shape2", "dummy", "sid", "dist", "npval", "slope", "ppval", "bpval"))


#BH correction
tot.perm$bh=p.adjust(tot.perm$bpval, method="fdr")

#plot qqplot
png("../output/qqplot_Total_APAperm_4pc.png")
qqplot_total= qqplot(-log10(runif(nrow(tot.perm))), -log10(tot.perm$bpval),ylab="-log10 Total permuted pvalue", xlab="Uniform expectation", main="Total permuted pvalues for all snps\n 4pc")
abline(0,1)
dev.off()

#write df with BH

write.table(tot.perm, file = "../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Total_permResBH.txt", col.names = T, row.names = F, quote = F)

print("Total complete")
##nuclear results


nuc.perm= read.table("../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear_permRes.txt",head=F, stringsAsFactors=F, col.names = c("pid", "nvar", "shape1", "shape2", "dummy", "sid", "dist", "npval", "slope", "ppval", "bpval"))
nuc.perm$bh=p.adjust(nuc.perm$bpval, method="fdr")


#plot qqplot
png("../output/qqplot_Nuclear_APAperm_4pc.png")
qqplot(-log10(runif(nrow(nuc.perm))), -log10(nuc.perm$bpval),ylab="-log10 Nuclear permuted pvalue", xlab="Uniform expectation", main="Nuclear permuted pvalues for all snps \n 4pc")
abline(0,1)
dev.off()

# write df with BH
write.table(nuc.perm, file = "../data/apaQTLPermuted_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear_permResBH.txt", col.names = T, row.names = F, quote = F)
