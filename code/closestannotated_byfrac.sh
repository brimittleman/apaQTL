#!/bin/bash

#SBATCH --job-name=closestannotatedbyfrac.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=closestannotatedbyfrac.out
#SBATCH --error=closestannotatedbyfrac.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env



bedtools closest -s -a ../data/PAS/APApeak_Peaks_GeneLocAnno.Total.5perc.sort.bed -b ../data/AnnotatedPAS/human.PAS.sort.bed -D a > ../data/AnnotatedPAS/Total_DistanceMyPAS2Anno.bed


bedtools closest -s -a ../data/PAS/APApeak_Peaks_GeneLocAnno.Nuclear.5perc.sort.bed -b ../data/AnnotatedPAS/human.PAS.sort.bed -D a > ../data/AnnotatedPAS/Nuclear_DistanceMyPAS2Anno.bed
