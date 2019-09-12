#!/bin/bash

#SBATCH --job-name=FC_intronPASupandDown
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=FC_intronPASupandDown.out
#SBATCH --error=FC_intronPASupandDown.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

source ~/activate_anaconda.sh
conda activate three-prime-env

#upstream
featureCounts -a ../data/intronRNAratio/TotalIntronicPAS_intronUpstream.SAF -F SAF -o ../data/intronRNAratio/UpstreamIntron.fc /project2/yangili1/LCL/RNAseqGeuvadisBams/*.final.bam

#downstream
featureCounts -a ../data/intronRNAratio/TotalIntronicPAS_intronDownstream.SAF -F SAF -o ../data/intronRNAratio/DownstreamIntron.fc /project2/yangili1/LCL/RNAseqGeuvadisBams/*.final.bam
