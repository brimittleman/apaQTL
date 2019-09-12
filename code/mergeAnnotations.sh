#!/bin/bash

#SBATCH --job-name=mergeAnno
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=mergeAnno.out
#SBATCH --error=mergeAnno.err
#SBATCH --partition=bigmem2
#SBATCH --mem=32G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env




bedtools merge -i /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefseq_3UTR.sort.noCHR.bed -s > /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefSeq_Merged_UTR3.sort.bed


bedtools merge -i /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefSeq_FormatedallAnnotation.sort.bed -s > /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/ncbiRefSeq_Merged.FormatedallAnnotation.sort.bed
