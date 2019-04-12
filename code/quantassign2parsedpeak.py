#!/bin/bash

#SBATCH --job-name=assign2parsedPeak
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=assign2parsedPeak.out
#SBATCH --error=assign2parsedPeak.err
#SBATCH --partition=broadwl
#SBATCH --mem=8G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


inputdir=$2
anno=$1
outputTotal=$3
outputNuclear=$4

featureCounts -O -a ${anno} -F SAF -o {outputTotal} {inputdir}*T*.bam -s 1

featureCounts -O -a ${anno} -F SAF -o {outputNuclear} {inputdir}*N*.bam -s 1
