#!/bin/bash

#SBATCH --job-name=grouptranscripts
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=grouptranscripts.out
#SBATCH --error=grouptranscripts.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env



bedtools groupby -i  /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/AllTranscriptsbyName.sort.bed -g 1,4,6 -c 2,3 -o min,max > /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/AllTranscriptsbyName.Grouped.bed
