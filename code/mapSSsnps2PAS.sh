#!/bin/bash

#SBATCH --job-name=intersectPAS_ssSNPS
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=intersectPAS_ssSNPS.out
#SBATCH --error=intersectPAS_ssSNPS.err
#SBATCH --partition=bigmem2
#SBATCH --mem=32G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

bedtools map -a ../data/SNPinSS/SignalSiteRegions.sort.bed -b ../data/SNPinSS/SSregions_Allchr.sort.bed -c 4 -o concat > ../data/SNPinSS/SNPinSS2PAS.txt


bedtools map -a ../data/SNPinSS/SSRegions_permuted.sort.bed -b ../data/SNPinSS/SSRegionsPerm_Allchr.sort.bed -c 4 -o concat > ../data/SNPinSS/SNPinPermSS2PAS.txt


bedtools map -a ../data/SNPinSS/FiftyupstreamPASwSS.sort.bed -b ../data/SNPinSS/SNPSinFiftyupstreamPAS_Allchr.sort.bed -c 4 -o collapse > ../data/SNPinSS/SNPSinFiftyupstream2PAS.txt


bedtools map -a ../data/SNPinSS/OtherSSRegions.sort.bed -b ../data/SNPinSS/Otherregions_Allchr.sort.bed -c 4 -o collapse > ../data/SNPinSS/Otherregions2PAS.txt

bedtools map -a ../data/SNPinSS/UTRregionsPASnoSS.sort.bed -b ../data/SNPinSS/UTRnoSS_SNPsAllchr.sort.bed -c 4 -o collapse > ../data/SNPinSS/UTRnoSS_SNPsAllchr2PAS.txt
