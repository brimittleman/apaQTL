#!/bin/bash

#SBATCH --job-name=qtlFacetBoxplots
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=qtlFacetBoxplots.out
#SBATCH --error=qtlFacetBoxplots.err
#SBATCH --partition=broadwl
#SBATCH --mem=18G


#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

Fraction=$1
gene=$2
chrom=$3
snp=$4
peakID=$5


less /project2/gilad/briana/apaQTL/data/phenotype_5perc/APApeak_Phenotype_GeneLocAnno.${Fraction}.5perc.fc.gz | grep ${gene}_ > /project2/gilad/briana/apaQTL/data/ExampleQTLPlots/${gene}_${Fraction}PeaksPheno.txt


less /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${chrom}.vcf.gz  | grep ${snp} >  /project2/gilad/briana/apaQTL/data/ExampleQTLPlots/${gene}_${Fraction}PeaksGenotype.txt

Rscript apaqtlfacetboxplots.R -P /project2/gilad/briana/apaQTL/data/ExampleQTLPlots/${gene}_${Fraction}PeaksPheno.txt -G /project2/gilad/briana/apaQTL/data/ExampleQTLPlots/${gene}_${Fraction}PeaksGenotype.txt --gene ${gene} -p ${peakID}  -o /project2/gilad/briana/apaQTL/data/ExampleQTLPlots/${gene}_${Fraction}${SNP}${peakID}_boxplot.png
