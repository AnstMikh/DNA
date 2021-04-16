#!/bin/sh
#
#SBATCH --job-name=aDNA_2
#SBATCH --output=run.log
#SBATCH --error=error_2.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2

#use bcftools reheader vcf.fornat 4.1 --> 4.2 and GL: number=. --> number=G
srun bcftools concat -Oz ~/data/mapuche/mapuche_chr{1..22}.vcf.gz | bcftools sort -T ~/data/trash -Oz -o fixed_mapuche.vcf.gz
srun bcftools index -t -f fixed_mapuche.vcf.gz 
srun bcftools norm -f ~/data/fastq/human_g1k_v37.fasta -cx -Oz -o norm_mapuche.vcf.gz fixed_mapuche.vcf.gz
srun bcftools sort -T ~/data/trash -Oz -o sorted_mapuche.vcf.gz norm_mapuche.vcf.gz
srun bcftools index -t -f sorted_mapuche.vcf.gz


