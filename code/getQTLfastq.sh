#!/bin/bash

#SBATCH --job-name=seqQTLfastq
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=seqQTLfastq.out
#SBATCH --error=seqQTLfastq.err
#SBATCH --partition=bigmem2
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

bedtools getfasta -s -fi /project2/gilad/briana/genome_anotation_data/genome/Homo_sapiens.GRCh37.75.dna_sm.all.fa -bed ../data/motifdistrupt/TotQTLregion.bed  -fo  ../data/motifdistrupt/TotQTLregionSequences.fa


bedtools getfasta -s -fi /project2/gilad/briana/genome_anotation_data/genome/Homo_sapiens.GRCh37.75.dna_sm.all.fa -bed ../data/motifdistrupt/NucQTLregion.bed -fo ../data/motifdistrupt/NucQTLregionSequences.fa
