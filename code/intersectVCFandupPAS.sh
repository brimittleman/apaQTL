#!/bin/bash

#SBATCH --job-name=intersectVCFPAS
#SBATCH --account=pi-yangili1
#SBATCH --time=8:00:00
#SBATCH --output=intersectVCFPAS.out
#SBATCH --error=intersectVCFPAS.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END


#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

bedtools intersect -a   /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf  -b ../data/SNPinSS/FiftyupstreamPASwSS.sort.bed -wa > ../data/SNPinSS/VCFintersectFiftyupstreamPASwSS.sort.bed
