#!/bin/bash

#SBATCH --job-name=run_sepusage
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_sepusage.out
#SBATCH --error=run_sepusage.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
    python sepUsagePhen.py $i Total
done

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
    python sepUsagePhen.py $i Nuclear
done
