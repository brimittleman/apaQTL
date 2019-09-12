#!/bin/bash

#SBATCH --job-name=mergeRNABam
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=mergeRNAbam.out
#SBATCH --error=mergeRNAbam.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

samtools merge ../data/RNAseq/RNA_AllGeuvadis.bam /project2/yangili1/LCL/RNAseqGeuvadisBams/*.final.bam
