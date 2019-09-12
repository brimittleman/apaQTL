#!/bin/bash

#SBATCH --job-name=RNABam2BW
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=RNABam2BW.out
#SBATCH --error=RNABam2BW.err
#SBATCH --partition=bigmem2
#SBATCH --mem=200G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


bamCoverage --binSize 1 -b ../data/RNAseq/RNA_AllGeuvadis.sort.bam -o ../data/RNAseq/RNA_AllGeuvadis.sort.bw
