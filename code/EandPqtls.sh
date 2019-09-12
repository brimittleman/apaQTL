#!/bin/bash


#SBATCH --job-name=EandPqtl.nom
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=EandPqtl.out
#SBATCH --error=EandPqtl.err
#SBATCH --partition=broadwl
#SBATCH --mem=32G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env

for i in $(seq 1 30)
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf.gz --cov ../data/molPhenos/fastqtl_qqnorm_prot.fixed.noChr.5PC_tab.txt.pca --bed ../data/molPhenos/fastqtl_qqnorm_prot.fixed.noChr.txt.gz --out ../data/molQTLs/fastqtl_qqnorm_prot.fixed.nominal.chunk$i.out --chunk $i 30  --window 5e5 --include-samples ../data/molPhenos/fastqtl_qqnorm_prot.fixed.noChr.SAMP.txt
done


for i in $(seq 1 30)
do
/home/brimittleman/software/bin/FastQTL/bin/fastQTL.static --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.vcf.gz --cov ../data/molPhenos/fastqtl_qqnorm_RNAseq_phase2.fixed.noChr.5PC_tab.txt.pca --bed ../data/molPhenos/fastqtl_qqnorm_RNAseq_phase2.fixed.noChr.txt.gz --out ../data/molQTLs/fastqtl_qqnorm_RNAseq_phase2.fixed.nominal.chunk$i.out --chunk $i 30  --window 5e5 --include-samples ../data/molPhenos/fastqtl_qqnorm_RNAseq_phase2.Samples.txt
done
