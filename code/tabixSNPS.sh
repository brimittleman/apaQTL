#!/bin/bash


#SBATCH --job-name=tabixSNPs
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=tabixSNPs.out
#SBATCH --error=tabixSNPs.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END


#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
bgzip /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${i}.vcf
tabix -p vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${i}.vcf.gz
done
