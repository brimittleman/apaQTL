#!/bin/bash

#SBATCH --job-name=FC_NucintronPASupandDown
#SBATCH --account=pi-yangili1
#SBATCH --time=36:00:00
#SBATCH --output=FC_NucintronPASupandDown.out
#SBATCH --error=FC_NucintronPASupandDown.err
#SBATCH --partition=broadwl
#SBATCH --mem=36G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env

source ~/activate_anaconda.sh
conda activate three-prime-env

#upstream
featureCounts -a ../data/intronRNAratio/NuclearIntronicPAS_intronUpstream.SAF -F SAF -o ../data/intronRNAratio/NuclearUpstreamIntron.fc ../data/NascentRNA/NascentRNAMerged.sort.bam

#downstream
featureCounts -a ../data/intronRNAratio/NuclearIntronicPAS_intronDownstream.SAF -F SAF -o ../data/intronRNAratio/NuclearDownstreamIntron.fc ../data/NascentRNA/NascentRNAMerged.sort.bam
