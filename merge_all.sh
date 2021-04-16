#!/bin/sh
#
#SBATCH --job-name=aDNA
#SBATCH --output=run.log
#SBATCH --error=error.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2
srun bcftools merge -Oz -o ~/all_merge.vcf.gz ~/data/*.vcf.gz;
srun bcftools index -t -f all.merge.vcf.gz 
