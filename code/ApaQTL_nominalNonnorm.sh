#!/bin/bash


#SBATCH --job-name=APAqtl_nominal_nonNorm
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=APAqtl_nominal_nonNorm.out
#SBATCH --error=APAqtl_nominal_nonNorm.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz  --bed ../data/nonNorm_pheno/NuclearUsageChrom$i.txt.gz --out ../data/nonNorm_pheno/NuclearUsageChrom$i.nominal.out --chunk 1 1  --window  2.5e4 --include-samples ../data/phenotype/SAMPLE.txt

done

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz --bed ../data/nonNorm_pheno/TotalUsageChrom$i.txt.gz --out ../data/nonNorm_pheno/TotalUsageChrom$i.nominal.out --chunk 1 1   --window  2.5e4 --include-samples ../data/phenotype/SAMPLE.txt
done
