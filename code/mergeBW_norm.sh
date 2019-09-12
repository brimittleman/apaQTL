#!/bin/bash

#SBATCH --job-name=mergeBWnorm
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=mergeBWnorm.out
#SBATCH --error=mergeBWnorm.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

bedGraphToBigWig in.bedGraph chrom.sizes out.bw

bigWigMerge ../data/bw_norm/*N-combined-RPKM.bw ../data/mergedBW_norm/AllNuclearFiles_RPKM.bedgraph
sort -k1,1 -k2,2n ../data/mergedBW_norm/AllNuclearFiles_RPKM.bedgraph > ../data/mergedBW_norm/AllNuclearFiles_Sorted_RPKM.bedgraph

bedGraphToBigWig ../data/mergedBW_norm/AllNuclearFiles_Sorted_RPKM.bedgraph /project2/gilad/briana/genome_anotation_data/chrom.length.txt ../data/mergedBW_norm/AllNuclearFiles_Sorted_RPKM.bw


bigWigMerge ../data/bw_norm/*T-combined-RPKM.bw ../data/mergedBW_norm/AllTotalFiles_RPKM.bedgraph

sort -k1,1 -k2,2n ../data/mergedBW_norm/AllTotalFiles_RPKM.bedgraph > ../data/mergedBW_norm/AllTotalFiles_Sorted_RPKM.bedgraph

bedGraphToBigWig ../data/mergedBW_norm/AllTotalFiles_Sorted_RPKM.bedgraph /project2/gilad/briana/genome_anotation_data/chrom.length.txt ../data/mergedBW_norm/AllTotalFiles_Sorted_RPKM.bw
