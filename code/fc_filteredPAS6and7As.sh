#!/bin/bash

#SBATCH --job-name=getseq100up
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=getseq100up.out
#SBATCH --error=getseq100up.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env



featureCounts -O -a ../data/Version15bp6As/filter15upfiles/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.15upNUC6A.SAF -F SAF -o ../data/Version15bp6As/peakCoverage/APAPeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.15upNUC6A.Nuclear.Quant.fc ../data/sort_clean/*N*.bam -s 1


featureCounts -O -a ../data/Version15bp7As/filter15upfiles/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.15upNUC7A.SAF -F SAF -o ../data/Version15bp7As/peakCoverage/APAPeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.15upNUC7A.Nuclear.Quant.fc ../data/sort_clean/*N*.bam -s 1
