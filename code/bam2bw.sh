#!/bin/bash

#SBATCH --job-name=bam2bw
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=bam2bw.out
#SBATCH --error=bam2bw.err
#SBATCH --cpus-per-task=2
#SBATCH --partition=bigmem2
#SBATCH --mem=216G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


input=$1
output=$2


bamCoverage -b ${input} -o ${output}
