#!/bin/bash

#SBATCH --job-name=runFilterLD
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=runFilterLD.out
#SBATCH --error=runFilterLD.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

for i in $(ls /project2/gilad/briana/apaQTL/data/apaQTLs/LDsnps/*)
do
describer=$(echo ${i}| sed -e 's/.*LDsnps//'| sed -e 's/LD.txt//')
python filterLDsnps.py ${i} /project2/gilad/briana/apaQTL/data/apaQTLs/LDsnps_9${describer}LD9.txt
done
