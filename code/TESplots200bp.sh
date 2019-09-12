#!/bin/bash

#SBATCH --job-name=TESplots200bp.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=TESplots200bp.out
#SBATCH --error=TESplots200bp.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix reference-point -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.5primemost.bw /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.5primemost.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq_endProtCodGenes_sort.bed -b 200  -a 200 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_TES_200.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/BothFrac_TES_200.gz --plotTitle "Combined Reads TES" --refPointLabel "TES"  --heatmapHeight 7 --colorMap YlGnBu --plotTitle "Combined Reads TES"  -out /project2/gilad/briana/apaQTL/output/dtPlots/BothFrac_TES_200.png


computeMatrix reference-point -S ../data/GeuvadisRNA/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw  -R /project2/gilad/briana/genome_anotation_data/ncbiRefSeq_endProtCodGenes_sort.bed -b 200  -a 200 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_TES_200.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_TES_200.gz --plotTitle "Combined Reads TES" --refPointLabel "TES"  --heatmapHeight 7 --colorMap YlGnBu --plotTitle "Combined Reads TES"  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNA_TES_200.png
