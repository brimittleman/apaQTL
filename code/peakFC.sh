#!/bin/bash

#SBATCH --job-name=peak_fc
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=peak_fc.out
#SBATCH --error=peak_fc.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env

anno=$1
inDir= $2
outfile=$3

featureCounts -a ${anno} -F SAF -o ${outfile} ${inDir}/*.sort.bam -s 1
