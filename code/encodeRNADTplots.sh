#!/bin/bash

#SBATCH --job-name=EncodeRNADTPlotGeneRegions.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=EncodeRNADTPlotGeneRegions.out
#SBATCH --error=EncodeRNADTPlotGeneRegions.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix scale-regions -S ../data/EncodeRNA/ENCFF003BGQ.bigWig -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/EncodeRNA_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/EncodeRNA_Transcript.gz --plotTitle "Encode RNAseq at Transcripts" --heatmapHeight 7 --colorMap YlGnBu   -out /project2/gilad/briana/apaQTL/output/dtPlots/EncodeRNA_Transcript.png
