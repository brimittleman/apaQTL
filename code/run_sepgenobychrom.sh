#!/bin/bash


#SBATCH --job-name=run_sepgenobychrom
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=run_sepgenobychrom.out
#SBATCH --error=run_sepgenobychrom.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
do
python sepgenobychrom.py $i
done
