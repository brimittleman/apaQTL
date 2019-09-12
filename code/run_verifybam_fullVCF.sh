#!/bin/bash


#SBATCH --job-name=run_verifybam
#SBATCH --output=run_verifybam.out
#SBATCH --error=run_verifybam.err
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

i=$1
describer=$(echo ${i} | sed -e 's/.*\YL-SP-//' | sed -e "s/-combined-clean.sort.bam$//")
verifyBamID --vcf /home/bjf79/CurrentProjects/Comparative_eQTL/code/snakemake_workflow/MiscOutput/HumanVcfs/YRI.copy.vcf.gz  --bam ${i} --best --ignoreRG --out /project2/gilad/briana/apaQTL/data/verifyBAM_full/${describer}.verify
