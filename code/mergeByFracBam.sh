#!/bin/bash

#SBATCH --job-name=mergeBamFilesbyfrac
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=mergeBamFilesbyfrac.out
#SBATCH --error=mergeBamFilesbyfrac.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


inputdir=$1
outputTotal=$2
outputNuclear=$3


samtools merge ${outputTotal} ${inputdir}*T*.bam


samtools merge ${outputNuclear} ${inputdir}*N*.bam
