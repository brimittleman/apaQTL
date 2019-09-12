#!/bin/bash

#SBATCH --job-name=run_getApaPval4eQTLs
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_getApaPval4eQTLs.out
#SBATCH --error=run_getApaPval4eQTLs.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

python getApapval4eqtl.py "Total" "../data/overlapeQTLs/eQTLinTotalApa.txt"

python getApapval4eqtl.py "Nuclear" "../data/overlapeQTLs/eQTLinNuclearApa.txt"
