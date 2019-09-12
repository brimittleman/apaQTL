#!/bin/bash

#SBATCH --job-name=PACbioDT.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=PACbioDT.out
#SBATCH --error=PACbioDT.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

computeMatrix reference-point --referencePoint TES -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.bw  -R ../data/pacbio/pacbioPACBIO.Annotated.usage.PublicData.sort.bed -b 500 -a 500 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Total_lclpacbio.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Total_lclpacbio.gz --plotTitle "Total Reads PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu -out /project2/gilad/briana/apaQTL/output/dtPlots/Total_lclpacbio.png


computeMatrix reference-point --referencePoint TES  -S  /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.bw  -R ../data/pacbio/pacbioPACBIO.Annotated.usage.PublicData.sort.bed -b 500 -a 500 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_lclpacbio.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_lclpacbio.gz --plotTitle "NuclearReads PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/Nuclear_lclpacbio.png

computeMatrix reference-point --referencePoint TES  -S ../data/GeuvadisRNA/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw  -R ../data/pacbio/pacbioPACBIO.Annotated.usage.PublicData.sort.bed -b 500  -a 500 --transcript_id_designator 3 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_lclpacbio.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_lclpacbio.gz --plotTitle "RNA PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNA_lclpacbio.png
