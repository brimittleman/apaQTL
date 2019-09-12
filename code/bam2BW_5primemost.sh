#!/bin/bash

#SBATCH --job-name=bam2bw_5primemost
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=bam2bw_5primemost.out
#SBATCH --error=bam2bw_5primemost.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


input=$1
output=$2


bamCoverage --Offset 1 -b ${input} -o ${output}
