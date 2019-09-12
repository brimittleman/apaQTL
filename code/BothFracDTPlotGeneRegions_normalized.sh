#!/bin/bash

#SBATCH --job-name=BothFracDTPlotGeneRegions_norm.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=BothFracDTPlotGeneRegions_norm.out
#SBATCH --error=BothFracDTPlotGeneRegions_norm.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


computeMatrix scale-regions -S /project2/gilad/briana/apaQTL/data/mergedBW_norm/AllNuclearFiles_Sorted_RPKM.bw /project2/gilad/briana/apaQTL/data/mergedBW_norm/AllTotalFiles_Sorted_RPKM.bw -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_Transcript_normalize.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_Transcript_normalize.gz --plotTitle "RPKM at Transcripts" --heatmapHeight 7 --colorMap YlGnBu --plotTitle "RPKM at Transcriptst"  -out /project2/gilad/briana/apaQTL/output/dtPlots/BothFrac_Transcript_normalize.png
