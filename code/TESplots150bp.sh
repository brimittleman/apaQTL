#!/bin/bash

#SBATCH --job-name=TESplots150bp.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=TESplots150bp.out
#SBATCH --error=TESplots150bp.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix reference-point -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.5primemost.bw /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.5primemost.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq_endProtCodGenes_sort.bed -b 150  -a 150 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_TES_150.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_TES_150.gz --plotTitle "Combined Reads TES"  --refPointLabel "TES" --heatmapHeight 7 --colorMap YlGnBu --plotTitle "Combined Reads TES"  -out /project2/gilad/briana/apaQTL/output/dtPlots/BothFrac_TES_150.png


computeMatrix reference-point -S ../data/GeuvadisRNA/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq_endProtCodGenes_sort.bed -b 150  -a 150 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_TES_150.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_TES_150.gz --plotTitle "Combined Reads TES" --refPointLabel "TES"  --heatmapHeight 7 --colorMap YlGnBu --plotTitle "Combined Reads TES"  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNA_TES_150.png
