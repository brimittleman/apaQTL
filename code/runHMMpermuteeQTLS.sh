#!/bin/bash

#SBATCH --job-name=runHMMpermuteeQTLs.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runHMMpermuteeQTLs.out
#SBATCH --error=runHMMpermuteeQTLs.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

module load Anaconda3
source activate three-prime-env

python HmmPermute.py "../data/Li_eQTLs/unexplained_FDR10.SNPs.noChr.bed" "../data/HMMqtls/unexplainedeQTLs.HMM1000times.txt"

python HmmPermute.py "../data/Li_eQTLs/explained_FDR10.SNPs.noChr.bed" "../data/HMMqtls/explainedQTLs.HMM1000times.txt"
