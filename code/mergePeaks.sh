#!/bin/bash

#SBATCH --job-name=mergePeaks
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=mergePeaks.out
#SBATCH --error=mergePeaks.err
#SBATCH --partition=broadwl
#SBATCH --mem=8G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


inputdir=$1
output=$2

cat ${inputdir}/* > ${output}
