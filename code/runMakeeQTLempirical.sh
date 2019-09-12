#!/bin/bash

#SBATCH --job-name=runMakeEmpiricaleQTLs
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runMakeEmpiricaleQTLs.out
#SBATCH --error=runMakeEmpiricaleQTLs.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


python  makeeQTLempiricaldist.py "Total" "../data/overlapeQTLs/eQTL_Total_EmpiricalDist.txt"
python  makeeQTLempiricaldist.py "Nuclear" "../data/overlapeQTLs/eQTL_Nuclear_EmpiricalDist.txt"
