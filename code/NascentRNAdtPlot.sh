#!/bin/bash

#SBATCH --job-name=NascentDTPlotGeneRegions.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=NascentDTPlotGeneRegions.out
#SBATCH --error=NascentDTPlotGeneRegions.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix scale-regions -S ../data/NascentRNA/NascentRNAMerged.sort.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named.bed -b 1000  -a 1000 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_Transcript.gz --plotTitle "Nascent RNA Transcript" --heatmapHeight 7  --averageTypeSummaryPlot "median" --colorMap YlGnBu -out /project2/gilad/briana/apaQTL/output/dtPlots/NascentRNA_Transcript.png
