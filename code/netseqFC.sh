#!/bin/bash

#SBATCH --job-name=netseqFC
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=netseqFC.out
#SBATCH --error=netseqFC.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env


featureCounts -O -a /project2/gilad/briana/genome_anotation_data/gencode.v19.TSSannotation.SAF -F SAF -o ../data/netseq/netseq_TSS.fc ../data/netseq/*sort.bam -s1
