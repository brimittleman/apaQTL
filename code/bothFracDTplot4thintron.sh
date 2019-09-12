#!/bin/bash

#SBATCH --job-name=BothFracDTPlot4stintron.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=BothFracDTPlot4stintron.out
#SBATCH --error=BothFracDTPlot4stintron.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env



computeMatrix scale-regions -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.5primemost.bw /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.5primemost.bw  -R ../data/intron_analysis/FourthIntronOnly_Sort.bed -b 500  -a 500 --skipZeros --transcript_id_designator 4 -out ../data/DTmatrix/BothFrac_FourthIntron.gz

plotHeatmap --sortRegions descend -m ../data/DTmatrix/BothFrac_FourthIntron.gz --plotTitle "Combined Reads Fourth intron" --heatmapHeight 7 --colorMap YlGnBu --startLabel "5' SS" --endLabel "3' SS" --averageTypeSummaryPlot "median" -out /project2/gilad/briana/apaQTL/output/dtPlots/BothFrac_FourthIntron.png
