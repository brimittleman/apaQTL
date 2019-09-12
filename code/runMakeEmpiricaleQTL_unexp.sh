#!/bin/bash

#SBATCH --job-name=runMakeEmpiricaleQTLsunex
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runMakeEmpiricaleQTLsunex.out
#SBATCH --error=runMakeEmpiricaleQTLsunex.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env


python  makeeQTLempirical_unexp.py "Total" "../data/overlapeQTLs/eQTLUnexp_Total_EmpiricalDist.txt"
python  makeeQTLempirical_unexp.py "Nuclear" "../data/overlapeQTLs/eQTLUnexp_Nuclear_EmpiricalDist.txt"
