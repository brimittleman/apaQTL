#!/bin/bash

#SBATCH --job-name=runres2pas
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=runres2pas.out
#SBATCH --error=runres2pas.err
#SBATCH --partition=bigmem2
#SBATCH --mem=32G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env




python NomResfromPASSNP.py ../data/SNPinSS/SS_PASandSNPs.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/SS_Nuclear_nomRes.txt

python NomResfromPASSNP.py ../data/SNPinSS/SS_PASandSNPs.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/SS_Total_nomRes.txt


python NomResfromPASSNP.py ../data/SNPinSS/PermSS_PASandSNPs.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/PermSS_Nuclear_nomRes.txt

python NomResfromPASSNP.py ../data/SNPinSS/PermSS_PASandSNPs.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/PermSS_Total_nomRes.txt


python NomResfromPASSNP.py ../data/SNPinSS/PASregion_PASandSNPs.FIXED.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/RegionSS_Nuclear_nomRes.txt

python NomResfromPASSNP.py ../data/SNPinSS/PASregion_PASandSNPs.FIXED.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/RegionSS_Total_nomRes.txt

python NomResfromPASSNP.py ../data/SNPinSS/Otherregions_PASandSNPs.FIXED.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Nuclear.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/OtherSS_Nuclear_nomRes.txt

python NomResfromPASSNP.py ../data/SNPinSS/Otherregions_PASandSNPs.FIXED.txt ../data/apaQTLNominal_4pc/APApeak_Phenotype_GeneLocAnno.Total.5perc.fc.gz.qqnorm_AllChrom.txt ../data/apaQTLNominal_4pc/OtherSS_Total_nomRes.txt
