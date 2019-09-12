#!/bin/bash

#SBATCH --job-name=mergeBamFiles
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=mergeBamFiles.out
#SBATCH --error=mergeBamFiles.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

inputdir=$1
output=$2


samtools merge ${output} ${inputdir}*.bam
