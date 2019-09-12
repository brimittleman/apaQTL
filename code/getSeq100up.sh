#!/bin/bash

#SBATCH --job-name=getseq100up
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=getseq100up.out
#SBATCH --error=getseq100up.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

bedtools nuc -seq -fi /project2/gilad/briana/genome_anotation_data/genome/Homo_sapiens.GRCh37.75.dna_sm.all.fa -bed /project2/gilad/briana/apaQTL/data/SignalSiteFiles/APAPAS_100up.bed > /project2/gilad/briana/apaQTL/data/SignalSiteFiles/APAPAS_100upSequences.bed
