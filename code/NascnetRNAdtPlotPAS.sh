#!/bin/bash

#SBATCH --job-name=NascentDTPlotPAS
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=NascentDTPlotPAS.out
#SBATCH --error=NascentDTPlotPAS.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


computeMatrix reference-point -S ../data/NascentRNA/NascentRNAMerged.sort.bw  -R ../data/PAS/APAPAS_GeneLocAnno.5perc_withCHR.bed -b 1000  -a 1000 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_PAS.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_PAS.gz --plotTitle "Nascent RNA at PAS" --heatmapHeight 7 --averageTypeSummaryPlot "median" --colorMap YlGnBu --refPointLabel "PAS" -out /project2/gilad/briana/apaQTL/output/dtPlots/NascentRNA_PAS.png
