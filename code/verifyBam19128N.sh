#!/bin/bash


#SBATCH --job-name=run_verifybam128N
#SBATCH --output=run_verifybam128N.out
#SBATCH --error=run_verifybam128N.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --exclusive
#SBATCH --time=12:00:00

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


verifyBamID --vcf  YRI_LCL_chr1.vcf.gz.recode.vcf  --bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19128-N-combined-clean.sort.bam --best --ignoreRG --smID NA19128 --out /project2/gilad/briana/apaQTL/data/verifyBAM/19128-N.SecondTry.verify
