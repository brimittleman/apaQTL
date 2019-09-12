#!/bin/bash

#SBATCH --job-name=run_leafcutter_ds
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=run_leafcutter_ds.out
#SBATCH --error=run_leafcutter_ds.err
#SBATCH --partition=broadwl
#SBATCH --mem=50G
#SBATCH --mail-type=END

module unload Anaconda3
#module load R
module load Anaconda3/5.3.0
source  activate leafcutter


for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
Rscript /project2/gilad/briana/davidaknowles-leafcutter-c3d9474/scripts/leafcutter_ds.R --num_threads 4  ../data/DiffIso/APApeaks.ALLChrom.Filtered.Named.GeneLocAnnoPARSED.5percCov.bothfrac.fixed.forLC.fc_${i}.txt ../data/bothFrac_FC/sample_groups.txt -o ../data/DiffIso/TN_diff_isoform_chr${i}.txt
done
