#!/bin/bash

#SBATCH --job-name=prxySNP
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=prxySNP.out
#SBATCH --error=prxySNP.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

cat /project2/gilad/briana/apaQTL/data/apaQTLs/NuclearQTLSNPsRSID.txt| while read line
do
echo "curl -k -X GET 'https://ldlink.nci.nih.gov/LDlinkRest/ldproxy?var=${line}&pop=YRI&r2_d=r2&token=85de9ca07fba' > /project2/gilad/briana/apaQTL/data/apaQTLs/LDsnps/${line}.LD.txt"
done
