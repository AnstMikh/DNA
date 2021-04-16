#!/bin/sh
#
#SBATCH --job-name=aDNA_2
#SBATCH --output=run.log
#SBATCH --error=error_2.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2
srun bcftools norm -f ~/data/human_g1k_37/human_g1k_v37.fasta -cx -Oz -o ~/norm_ancient.vcf.gz ~/ancient.vcf.gz
