#!/bin/bash

#SBATCH --job-name=bam2bw
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=bam2bw.out
#SBATCH --error=bam2bw.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


input=$1
output=$2


bamCoverage -b ${input} -o ${output}
