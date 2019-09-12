#!/bin/bash

#SBATCH --job-name=IntronicPASDT.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=IntronicPASDT.out
#SBATCH --error=IntronicPASDT.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix reference-point -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Total.SamplesMerged.bw  -R ../data/PAS/APAPAS_GeneLocAnno.5perc_withCHR_Intronic.bed -b 500 -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Total_IntronPAS.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Total_IntronPAS.gz --plotTitle "Total Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu -out /project2/gilad/briana/apaQTL/output/dtPlots/Total_IntronPAS.png


computeMatrix reference-point -S /project2/gilad/briana/apaQTL/data/mergedBW_byfrac/Nuclear.SamplesMerged.bw  -R ../data/PAS/APAPAS_GeneLocAnno.5perc_withCHR_Intronic.bed -b 500 -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_IntronicPAS.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/Nuclear_IntronicPAS.gz --plotTitle "Nuclear Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu   -out /project2/gilad/briana/apaQTL/output/dtPlots/Nuclear_IntronicPAS.png

computeMatrix reference-point -S ../data/GeuvadisRNA/RNAseqGeuvadis_STAR_6samp_MergedBams.sort.bw  -R ../data/PAS/APAPAS_GeneLocAnno.5perc_withCHR_Intronic.bed -b 500  -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_IntonicPAS.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/RNA_IntonicPAS.gz --plotTitle "RNA Intronic PAS" --refPointLabel "PAS"  --heatmapHeight 7 --colorMap YlGnBu  -out /project2/gilad/briana/apaQTL/output/dtPlots/RNA_IntonicPAS.png
