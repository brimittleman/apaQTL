#!/bin/bash

#SBATCH --job-name=run_getApaPval4eQTLsunexplained
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_getApaPval4eQTLsunexplained.out
#SBATCH --error=run_getApaPval4eQTLsunexplained.err
#SBATCH --partition=broadwl
#SBATCH --mem=12G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env


python getApapval4eqtl_unexp.py "Total" "../data/overlapeQTLs/UnexplainedeQTLinTotalApa.txt"

python getApapval4eqtl_unexp.py "Nuclear" "../data/overlapeQTLs/UnexplainedeQTLinNuclearApa.txt"
