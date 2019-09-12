#!/bin/bash

#SBATCH --job-name=run_getAPAfromanyeQTL
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=run_getAPAfromanyeQTL.out
#SBATCH --error=run_getAPAfromanyeQTL.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

source ~/activate_anaconda.sh
conda activate three-prime-env

python getAPAfromanyeQTL.py ../data/Version15bp6As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp6A.5perc_nomRes_SNPLOC.txt ../data/Li_eQTLs/explained_FDR10.sort_FIXED.txt  ../data/Version15bp6As/overlapeQTL/apa_explainedQTLs.txt

python getAPAfromanyeQTL.py ../data/Version15bp6As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp6A.5perc_nomRes_SNPLOC.txt ../data/Li_eQTLs/unexplained_FDR10.sort_FIXED.txt  ../data/Version15bp6As/overlapeQTL/apa_unexplainedQTLs.txt

python getAPAfromanyeQTL.py ../data/Version15bp7As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp7A.5perc_nomRes_SNPLOC.txt ../data/Li_eQTLs/explained_FDR10.sort_FIXED.txt  ../data/Version15bp7As/overlapeQTL/apa_explainedQTLs.txt

python getAPAfromanyeQTL.py ../data/Version15bp7As/apaQTLNominal/APApeak_Phenotype_GeneLocAnno.Nuclear_15bp7A.5perc_nomRes_SNPLOC.txt ../data/Li_eQTLs/unexplained_FDR10.sort_FIXED.txt  ../data/Version15bp7As/overlapeQTL/apa_unexplainedQTLs.txt
