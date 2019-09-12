#!/bin/bash

#SBATCH --job-name=run_bam2bw
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_bam2bw.out
#SBATCH --error=run_bam2bw.err
#SBATCH --cpus-per-task=2
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in $(ls /project2/gilad/briana/apaQTL/data/sort_clean/*.bam)
do
describer=$(echo ${i}| sed -e 's/.*sort_clean//'| sed -e 's/-combined-clean.sort.bam//')
echo $i
sbatch bam2bw.sh $i ../data/bw${describer}.combined.bw
done
