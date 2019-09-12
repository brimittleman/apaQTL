#!/bin/bash

#SBATCH --job-name=subsetvcf_rand
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=subsetvcf_rand.out
#SBATCH --error=subsetvcf_rand.err
#SBATCH --partition=bigmem2
#SBATCH --mem=36G

#SBATCH --mail-type=END


module load vcftools


for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
vcftools --gzvcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr$i.vcf.gz --bed ../data/SNPinSS/OtherSSRegions.nochr.sort.bed --out ../data/SNPinSS/Otherregions_chr$i.vcf --recode --keep-INFO-all
done
