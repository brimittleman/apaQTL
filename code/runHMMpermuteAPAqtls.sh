#!/bin/bash


#SBATCH --job-name=runHMMpermuteapaQTLs.sh
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runHMMpermute.out
#SBATCH --error=runHMMpermute.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

python HmmPermute.py "../data/apaQTLs/Nuclear_apaQTLs4pc_5fdr.bed" "../data/HMMqtls/NuclearAPAqtls.HMM1000times.txt"

python HmmPermute.py "../data/apaQTLs/Total_apaQTLs4pc_5fdr.bed" "../data/HMMqtls/TotalAPAqtls.HMM1000times.txt"
