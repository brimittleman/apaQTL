#!/bin/bash

#SBATCH --job-name=runBestBamID
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=../data/verifyBAM/BestBamID.out
#SBATCH --error=runBestBamID.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in $(ls /project2/gilad/briana/apaQTL/data/verifyBAM/*.bestSM)
do
python parseBestbamid.py $i
done
