#!/bin/bash

#SBATCH --job-name=netDTPlot4thintron.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=netDTPlot4thintron.out
#SBATCH --error=neyDTPlot4thintron.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


computeMatrix scale-regions -S /project2/gilad/briana/Net-seq/Net-seq3/data/sort/Merged.Net3.sort.bw  -R ../data/intron_analysis/FourthIntronOnly_Sort.bed -b 500  -a 500  --skipZeros  --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Netseq_FourthIntron.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Netseq_FourthIntron.gz --plotTitle "Netseq Fourth intron" --heatmapHeight 7 --colorMap YlGnBu --startLabel "5' SS" --endLabel "3' SS" --averageTypeSummaryPlot "median"  -out /project2/gilad/briana/apaQTL/output/dtPlots/Netseq_FourthIntron.png
