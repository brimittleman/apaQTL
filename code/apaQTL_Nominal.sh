#!/bin/bash


#SBATCH --job-name=APAqtl_nominal
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=APAqtl_nominal.out
#SBATCH --error=APAqtl_nominal.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz --cov ../data/phenotype_5perc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.2PCs --bed ../data/phenotype_5perc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_chr$i.gz --out ../data/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_chr$i.nominal.out --chunk 1 1  --window 5e5 --include-samples ../data/phenotype/SAMPLE.txt

done

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz --cov ../data/phenotype_5perc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.2PCs --bed ../data/phenotype_5perc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_chr$i.gz --out ../data/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_chr$i.nominal.out --chunk 1 1  --window 5e5 --include-samples ../data/phenotype/SAMPLE.txt
done
