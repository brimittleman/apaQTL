#!/bin/bash

#SBATCH --job-name=run_bam2bw_exta
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_bam2bwexta.out
#SBATCH --error=run_bam2bwexta.err
#SBATCH --cpus-per-task=2
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in $(/project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19225-N-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19225-T-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19238-N-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19238-T-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19239-N-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19239-T-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19257-N-combined-clean.sort.bam /project2/gilad/briana/apaQTL/data/sort_clean/YL-SP-19257-T-combined-clean.sort.bam)
do
describer=$(echo ${i}| sed -e 's/.*sort_clean//'| sed -e 's/-combined-clean.sort.bam//')
echo $i
sbatch bam2bw.sh $i ../data/bw${describer}.combined.bw
done
