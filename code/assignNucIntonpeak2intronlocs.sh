#!/bin/bash

#SBATCH --job-name=assignPeak2Intronicregion
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=assignPeak2Intronicregion.out
#SBATCH --error=assignPeak2Intronicregion.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


bedtools intersect -a /project2/gilad/briana/apaQTL/data/intron_analysis/transcriptsMinusExons.sort.bed -b /project2/gilad/briana/apaQTL/data/intron_analysis/NuclearIntronicPeaks.bed -S -wa -wb  > /project2/gilad/briana/apaQTL/data/intron_analysis/IntronPeaksontoIntrons.bed
