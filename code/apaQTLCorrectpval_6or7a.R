library(dplyr)


##total results
tot.perm= read.table("../data/Version15bp6As/apaQTLPermuted/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp6A.5perc_permRes.txt",head=F, stringsAsFactors=F, col.names = c("pid", "nvar", "shape1", "shape2", "dummy", "sid", "dist", "npval", "slope", "ppval", "bpval"))


#BH correction
tot.perm$bh=p.adjust(tot.perm$bpval, method="fdr")


#write df with BH

write.table(tot.perm, file = "../data/Version15bp6As/apaQTLPermuted/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp6A.5perc_permResBH.txt", col.names = T, row.names = F, quote = F)

print("6A complete")
##nuclear results


nuc.perm= read.table("../data/Version15bp7As/apaQTLPermuted/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp7A.5perc_permRes.txt",head=F, stringsAsFactors=F, col.names = c("pid", "nvar", "shape1", "shape2", "dummy", "sid", "dist", "npval", "slope", "ppval", "bpval"))
nuc.perm$bh=p.adjust(nuc.perm$bpval, method="fdr")




# write df with BH
write.table(nuc.perm, file = "../data/Version15bp7As/apaQTLPermuted/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp7A.5perc_permResBH.txt", col.names = T, row.names = F, quote = F)
