#!/bin/bash

# sbatch submission script to run main snakemake process. It then submits
# individual jobs from the compute node.


#SBATCH --job-name=snakemake
#SBATCH --output=snakelog.out
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH --mem=4G
#SBATCH --tasks-per-node=4
#SBATCH --mail-type=END
#SBATCH --output=apaQTLsnake.out
#SBATCH --error=apaQTLsnake.err


#module load Anaconda3
#source activate three-prime-env

source ~/activate_anaconda.sh
conda activate three-prime-env


bash submit-snakemake.sh $*
