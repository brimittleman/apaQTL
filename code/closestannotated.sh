#!/bin/bash

#SBATCH --job-name=closestannotated.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=closestannotated.out
#SBATCH --error=closestannotated.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env





bedtools closest -s -a ../data/PAS/APAPAS_GeneLocAnno.5perc.sort.bed -b ../data/AnnotatedPAS/human.PAS.sort.bed -D a > ../data/AnnotatedPAS/DistanceMyPAS2Anno.bed
