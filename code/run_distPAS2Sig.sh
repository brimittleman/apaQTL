#!/bin/bash

#SBATCH --job-name=run_DistPAS2Sig
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_DistPAS2Sig.out
#SBATCH --error=run_DistPAS2Sig.err
#SBATCH --partition=broadwl
#SBATCH --mem=16G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

python DistPAS2Sig.py AATAAA
python DistPAS2Sig.py ATTAAA
python DistPAS2Sig.py AGTAAA
python DistPAS2Sig.py TATAAA
python DistPAS2Sig.py CATAAA
python DistPAS2Sig.py GATAAA
python DistPAS2Sig.py AATATA
python DistPAS2Sig.py AATACA
python DistPAS2Sig.py AATAGA
python DistPAS2Sig.py AAAAAG
python DistPAS2Sig.py ACTAAA
python DistPAS2Sig.py AAAAAA
