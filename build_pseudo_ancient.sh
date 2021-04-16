#!/bin/sh
#
#SBATCH --job-name=aDNA1
#SBATCH --output=run.log
#SBATCH --error=error_1.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2
module load angsd/v0.933
srun bwa index /home/anastasia.mikhailova/data/human_g1k_v37.fasta
srun bcftools norm -f ~/data/human_g1k_37/human_g1k_v37.fasta -cx -Oz -o norm_pseudo_without_36.vcf.gz pseudo_without_36.vcf.gz
srun bcftools index -t -f norm_pseudo_without_36.vcf.gz
srun bcftools merge -Oz -o new_ancient.vcf.gz norm_pseudo_without_36.vcf.gz norm_36.vcf.gz
srun bcftools index -t -f new_ancient.vcf.gz
