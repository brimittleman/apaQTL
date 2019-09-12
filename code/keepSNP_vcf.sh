#!/bin/bash


#SBATCH --job-name=vcf_keepsnps
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=vcf_keepsnps.out
#SBATCH --error=vcf_keepsnps.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END


#module load bcftools
#module load vcftools
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
bcftools view --types snps /project2/yangili1/ankeetashah/APA_tools/pacbio_2/89_VCF/chr${i}.keep.recode.two.vcf.gz > /project2/gilad/briana/GEU_geno/chr${i}.keep.recode.two.snps.vcf
done
