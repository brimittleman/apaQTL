#!/bin/bash

#SBATCH --job-name=sortindexRNABam
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=sortindexRNABam.out
#SBATCH --error=sortindexRNABam.err
#SBATCH --partition=bigmem2
#SBATCH --mem=200G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

samtools sort ../data/RNAseq/RNA_AllGeuvadis.bam -o ../data/RNAseq/RNA_AllGeuvadis.sort.bam
samtools index ../data/RNAseq/RNA_AllGeuvadis.sort.bam
