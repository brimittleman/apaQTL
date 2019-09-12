#!/bin/bash

#SBATCH --job-name=FC_UTR
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=FC_UTR.out
#SBATCH --error=FC_UTR.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

#new bams
featureCounts -a ../data/Reads2UTR/ncbiRefseq_3UTR.SAF -F SAF -o ../data/Reads2UTR/Nuclear_newdata_UTR.fc /project2/gilad/briana/apaQTL/data/sort_clean/*N-combined-clean.sort.bam -s 2

featureCounts -a ../data/Reads2UTR/ncbiRefseq_3UTR.SAF -F SAF -o ../data/Reads2UTR/Total_newdata_UTR.fc /project2/gilad/briana/apaQTL/data/sort_clean/*T-combined-clean.sort.bam -s 2


#old bams
featureCounts -a ../data/Reads2UTR/ncbiRefseq_3UTR.SAF -F SAF -o ../data/Reads2UTR/Nuclear_olddata_UTR.fc /project2/gilad/briana/threeprimeseq/data/sort/*N-combined-sort.bam -s 2

featureCounts -a ../data/Reads2UTR/ncbiRefseq_3UTR.SAF -F SAF -o ../data/Reads2UTR/Total_olddata_UTR.fc /project2/gilad/briana/threeprimeseq/data/sort/*T-combined-sort.bam -s 2
