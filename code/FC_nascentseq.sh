#!/bin/bash

#SBATCH --job-name=FC_nascent
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=FC_nascentout
#SBATCH --error=FC_nascent.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

featureCounts -a /project2/gilad/briana/genome_anotation_data/refseq.ProteinCoding.SAF -F SAF -o ../data/NascentRNA/NascentRNA.fc /project2/yangili1/yangili/RNAseqmap/nascentRNAseq/1*.sorted.bam
