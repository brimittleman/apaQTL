#!/bin/bash

#SBATCH --job-name=mnaseDTPlot4thintron.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=mnaseDTPlot4thintron.out
#SBATCH --error=mnaseDTPlot4thintron.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


computeMatrix scale-regions -S /project2/gilad/briana/threeprimeseq/data/ChipSeq/wgEncodeSydhNsomeGm12878Sig.bigWig  -R ../data/intron_analysis/FourthIntronOnly_Sort.bed -b 500  -a 500 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/MNase_FourthIntron.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/MNase_FourthIntron.gz --plotTitle "MNase Fourth intron" --heatmapHeight 7 --colorMap YlGnBu --startLabel "5' SS" --endLabel "3' SS"  -out /project2/gilad/briana/apaQTL/output/dtPlots/MNase_FourthIntron.png
