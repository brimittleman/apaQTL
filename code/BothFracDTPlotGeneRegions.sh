#!/bin/bash

#SBATCH --job-name=BothFracDTPlotGeneRegions.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=BothFracDTPlotGeneRegions.out
#SBATCH --error=BothFracDTPlotGeneRegions.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env


computeMatrix scale-regions -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.5primemost.bw /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.5primemost.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_Transcript.gz --plotTitle "Combined Reads Transcript" --heatmapHeight 4 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/BothFrac_Transcript.pdf


computeMatrix scale-regions -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.5primemost.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_Transcript.gz --plotTitle "Combined Reads Transcript" --heatmapHeight 4 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/Nuclear_Transcript.pdf


computeMatrix scale-regions -S  /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.5primemost.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Total_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Total_Transcript.gz --plotTitle "Combined Reads Transcript" --heatmapHeight 4 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/Total_Transcript.pdf
