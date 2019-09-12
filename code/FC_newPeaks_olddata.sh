#!/bin/bash

#SBATCH --job-name=FC_newPAS_olddata
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=FC_newPAS_olddata.out
#SBATCH --error=FC_newPAS_olddata.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

#new bams
featureCounts -a ../data/CompareOldandNew/APApeak_5perc_Nuclear.SAF -F SAF -o ../data/CompareOldandNew/Nuclear/New5percPeaks_Nuclear_newdata.fc ../data/sort_clean/*N-combined-clean.sort.bam -s 1

featureCounts -a ../data/CompareOldandNew/APApeak_5perc_Total.SAF -F SAF -o ../data/CompareOldandNew/Total/New5percPeaks_Total_newdata.fc ../data/sort_clean/*T-combined-clean.sort.bam -s 1


#old bams
featureCounts -a ../data/CompareOldandNew/APApeak_5perc_Nuclear.SAF -F SAF -o ../data/CompareOldandNew/Nuclear/New5percPeaks_Nuclear_olddata.fc /project2/gilad/briana/threeprimeseq/data/sort/*N-combined-sort.bam -s 1

featureCounts -a ../data/CompareOldandNew/APApeak_5perc_Total.SAF -F SAF -o ../data/CompareOldandNew/Total/New5percPeaks_Total_olddata.fc /project2/gilad/briana/threeprimeseq/data/sort/*T-combined-sort.bam -s 1
