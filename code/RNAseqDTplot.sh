#!/bin/bash

#SBATCH --job-name=RNAseqDTPlotGeneRegions.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=RNAseqDTPlotGeneRegions.out
#SBATCH --error=RNAseqDTPlotGeneRegions.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix scale-regions -S /project2/gilad/briana/threeprimeseq/data/rnaseq_bw/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq.mRNA.named_noCHR.bed -b 1000  -a 1000 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNAseq_Transcript.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNAseq_Transcript.gz --regionsLabel "RefSeq Transcript"  --heatmapHeight 4 --colorMap YlGnBu --plotTitle "Combined Reads Transcript"  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNAseq_Transcript.pdf
