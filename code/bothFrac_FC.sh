#!/bin/bash

#SBATCH --job-name=bothFrac_FC
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=bothFrac_FC.out
#SBATCH --error=bothFrac_FC.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


featureCounts -O -a ../data/peaks_5perc/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.SAF -F SAF -o ../data/bothFrac_FC/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fc ../data/sort_clean/*combined-clean.sort.bam -s 1
