#!/bin/bash


#SBATCH --job-name=run_verifybam517T
#SBATCH --output=run_verifybam517T.out
#SBATCH --error=run_verifybam517T.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --exclusive
#SBATCH --time=12:00:00
#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


verifyBamID --vcf  YRI_LCL_chr1.vcf.gz.recode.vcf  --bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-18517-T-combined-clean.sort.bam --best --ignoreRG --smID NA18517 --out /project2/gilad/briana/apaQTL/data/verifyBAM/18517-T.SecondTry.verify
