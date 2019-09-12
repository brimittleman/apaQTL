#!/bin/bash

#SBATCH --job-name=mergeBamNacent
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=mergeBamNacent.out
#SBATCH --error=mergeBamNacent.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


samtools merge ../data/NascentRNA/NascentRNAMerged.bam /project2/yangili1/yangili/RNAseqmap/nascentRNAseq/1*.sorted.bam

samtools sort ../data/NascentRNA/NascentRNAMerged.bam > ../data/NascentRNA/NascentRNAMerged.sort.bam

samtools index  ../data/NascentRNA/NascentRNAMerged.sort.bam
