#!/bin/bash

#SBATCH --job-name=subtractExons
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=subtractExons.out
#SBATCH --error=subtractExons.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env



bedtools subtract -a /project2/gilad/briana/genome_anotation_data/RefSeq_annotations/FullTranscriptByName.bed -b ../data/intron_analysis/ExonandUTRloc.sort.bed -s > /project2/gilad/briana/apaQTL/data/intron_analysis/transcriptsMinusExons.bed
