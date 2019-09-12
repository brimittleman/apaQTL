#!/bin/bash

#SBATCH --job-name=pttFacetBoxplots
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=pttFacetBoxplots.out
#SBATCH --error=pttFacetBoxplots.err
#SBATCH --partition=broadwl
#SBATCH --mem=18G


#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

Fraction=$1
gene=$2
chrom=$3
snp=$4


less /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${chrom}.vcf.gz  | grep ${snp} >  /project2/gilad/briana/apaQTL/data/pttQTLplots/${gene}_${Fraction}_${snp}_Genotype.txt


Rscript PTTfacetboxplots.R -F ${Fraction} -G /project2/gilad/briana/apaQTL/data/pttQTLplots/${gene}_${Fraction}_${snp}_Genotype.txt --gene ${gene}  -o /project2/gilad/briana/apaQTL/data/pttQTLplots/${gene}_${Fraction}${SNP}_boxplot.png
