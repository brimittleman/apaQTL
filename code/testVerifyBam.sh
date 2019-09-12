#!/bin/bash


#SBATCH --job-name=test_verifybam
#SBATCH --output=test_verifybam.out
#SBATCH --error=test_verifybam.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --constraint=edr
#SBATCH --nodes=6
#SBATCH --ntasks-per-node=13
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


describer=$(echo YL-SP-18486-N-combined-clean.sort.bam | sed -e 's/.*\YL-SP-//' | sed -e "s/-combined-clean.bam$//")
verifyBamID --vcf /project2/gilad/briana/genome_anotation_data/snps.hg19.exons.no_chr.vcf --bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-18486-N-combined-clean.sort.bam --best --ignoreRG --out /project2/gilad/briana/apaQTL/data/verifyBAM/${describer}.verify
