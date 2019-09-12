#!/bin/bash

#SBATCH --job-name=LD_vcftools.hap
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=LD_vcftools.hap.out
#SBATCH --error=rLD_vcftools.hap.err
#SBATCH --partition=broadwl
#SBATCH --mem=30G
#SBATCH --mail-type=END

module load vcftools
module unload plink
module load plink/1.90

#for i  in {1..22};
#do
plink --data /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF --gen /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.gen --sample /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.sample --r2 --ld-snp-list ../data/apaQTLs/TotalQTLSNPsRSID.txt --ld-window-r2 0.8 --out ../data/GWAS_overlap/TotalApaQTL_LD/totQTL.hap.LD
#vcftools --gzvcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${i}.vcf.gz  --ld-window 250000   --geno-r2-positions ../data/apaQTLs/TotalQTLSNPsRSID.txt --out ../data/GWAS_overlap/TotalApaQTL_LD/chr${i}.totQTL.hap.LD --geno-r2
#done


#for i  in {1..22};
#do
#plink --vcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${i}.vcf.gz --r2 dprime --ld-snp-list ../data/apaQTLs/NuclearQTLSNPsRSID.txt --ld-window-r2 0.8 --out ../data/GWAS_overlap/NuclearApaQTL_LD/chr${i}.nucQTL.hap.LD
#vcftools --gzvcf /project2/gilad/briana/li_genotypes/genotypesYRI.gen.proc.5MAF.chr${i}.vcf.gz  --ld-window 250000 --geno-r2-positions ../data/apaQTLs/NuclearQTLSNPsRSID.txt --out ../data/GWAS_overlap/NuclearApaQTL_LD/chr${i}.nucQTL.hap.LD  --geno-r2
#done
