#!/bin/bash

#SBATCH --job-name=runCorrectNomeqtl.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runCorrectNomeqtl.out
#SBATCH --error=runCorrectNomeqtl.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

Rscript correctNomeqtl.R
