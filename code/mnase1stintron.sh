#!/bin/bash

#SBATCH --job-name=mnaseDTPlot1stintron.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=mnaseDTPlot1stintron.out
#SBATCH --error=mnaseDTPlot1stintron.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


computeMatrix scale-regions -S /project2/gilad/briana/threeprimeseq/data/ChipSeq/wgEncodeSydhNsomeGm12878Sig.bigWig  -R ../data/intron_analysis/FirstIntronOnly_Sort.bed -b 500  -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/MNase_FirstIntron.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/MNase_FirstIntron.gz --plotTitle "MNase first intron" --heatmapHeight 7 --colorMap YlGnBu --startLabel "5' SS" --endLabel "3' SS"  -out /project2/gilad/briana/apaQTL/output/dtPlots/MNase_FirstIntron.png
