#!/bin/bash

#SBATCH --job-name=PACbioDTitronic.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=PACbioDTitronic.out
#SBATCH --error=PACbioDTitronic.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

computeMatrix reference-point --referencePoint TES -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.bw  -R ../data/pacbio/IntronicPacBioPAS.bed -b 500 -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Total_lclpacbioIntron.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Total_lclpacbioIntron.gz --plotTitle "Total Reads Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu -out /project2/gilad/briana/apaQTL/output/dtPlots/Total_lclpacbioIntron.png


computeMatrix reference-point --referencePoint TES  -S  /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.bw  -R  ../data/pacbio/IntronicPacBioPAS.bed -b 500 -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_lclpacbioIntronic.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_lclpacbioIntronic.gz --plotTitle "Nuclear Reads Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/Nuclear_lclpacbioIntronic.png

computeMatrix reference-point --referencePoint TES  -S ../data/GeuvadisRNA/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw  -R  ../data/pacbio/IntronicPacBioPAS.bed -b 500  -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_lclpacbioIntronic.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_lclpacbioIntronic.gz --plotTitle "RNA Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNA_lclpacbioIntronic.png
