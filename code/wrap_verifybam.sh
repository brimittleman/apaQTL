#!/bin/bash


#SBATCH --job-name=wrap_verifybam
#SBATCH --output=wrap_verifybam.out
#SBATCH --error=wrap_verifybam.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --ntasks-per-node=13
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3

#source activate three-prime-env

source ~/activate_anaconda.sh
conda activate three-prime-env


for i in $(ls /project2/gilad/briana/apaQTL/data/sort_clean/*.bam)
do
sbatch run_verifybam.sh ${i}
done
