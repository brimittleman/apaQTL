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

python getAPAfromanyeQTL.py ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom_SNPLOC.txt ../data/Li_eQTLs/explained_FDR10.sort_FIXED.txt  ../data/overlapeQTL_try2/apaTotal_explainedQTLs.txt

python getAPAfromanyeQTL.py ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom_SNPLOC.txt ../data/Li_eQTLs/unexplained_FDR10.sort_FIXED.txt  ../data/overlapeQTL_try2/apaTotal_unexplainedQTLs.txt

python getAPAfromanyeQTL.py ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom_SNPLOC.txt ../data/Li_eQTLs/explained_FDR10.sort_FIXED.txt  ../data/overlapeQTL_try2/apaNuclear_explainedQTLs.txt

python getAPAfromanyeQTL.py ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom_SNPLOC.txt ../data/Li_eQTLs/unexplained_FDR10.sort_FIXED.txt  ../data/overlapeQTL_try2/apaNuclear_unexplainedQTLs.txt
