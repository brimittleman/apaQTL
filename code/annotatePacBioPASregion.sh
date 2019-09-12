#!/bin/bash

#SBATCH --job-name=annotatedPASregion.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=annotatedPASregion.out
#SBATCH --error=annotatedPASregion.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env

bedtools map -a ../data/pacbio/pacbioPACBIO.Annotated.usage.PublicData.sort.bed -b /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefSeq_FormatedallAnnotation.sort.bed -c 4 -s -o distinct > ../data/pacbio/pacbioPACBIO.Annotated.usage.PublicData.sort_withAnnotation.bed
