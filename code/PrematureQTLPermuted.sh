#!/bin/bash


#SBATCH --job-name=Prematureqtl_permuted
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=Prematureqtl_permuted.out
#SBATCH --error=Prematureqtl_permuted.err
#SBATCH --partition=bigmem2
#SBATCH --mem=12G
#SBATCH --mail-type=END

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --permute 1000 --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz  --cov ../data/PreTerm_pheno/Nuclear_preterminationPheno.txt.gz.2PCs  --bed ../data/PreTerm_pheno/Nuclear_preterminationPheno.txt.gz.qqnorm_chr$i.gz --out ../data/PrematureQTLPermuted/Nuclear_preterminationPheno.txt.gz.qqnorm_chr$i.perm.out --chunk 1 1  --window 2.5e4 --include-samples ../data/phenotype/SAMPLE.txt
done

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --permute 1000 --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz  --cov ../data/PreTerm_pheno/Total_preterminationPheno.txt.gz.2PCs  --bed ../data/PreTerm_pheno/Total_preterminationPheno.txt.gz.qqnorm_chr$i.gz --out ../data/PrematureQTLPermuted/Total_preterminationPheno.txt.gz.qqnorm_chr$i.perm.out --chunk 1 1  --window 2.5e4 --include-samples ../data/phenotype/SAMPLE.txt
done
