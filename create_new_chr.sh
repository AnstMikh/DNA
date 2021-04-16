#!/bin/sh
#
#SBATCH --job-name=aDNA_2
#SBATCH --output=run.log
#SBATCH --error=error_2.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr22.vcf.gz  ~/tmps/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz–;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr21.vcf.gz  ~/tmps/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr20.vcf.gz  ~/tmps/ALL.chr20.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr19.vcf.gz  ~/tmps/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr18.vcf.gz  ~/tmps/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr17.vcf.gz  ~/tmps/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr16.vcf.gz  ~/tmps/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr15.vcf.gz  ~/tmps/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr14.vcf.gz  ~/tmps/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr13.vcf.gz  ~/tmps/ALL.chr13.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr12.vcf.gz  ~/tmps/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr11.vcf.gz  ~/tmps/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr10.vcf.gz  ~/tmps/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr9.vcf.gz  ~/tmps/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr8.vcf.gz  ~/tmps/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr7.vcf.gz  ~/tmps/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr6.vcf.gz  ~/tmps/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr5.vcf.gz  ~/tmps/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr4.vcf.gz  ~/tmps/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr3.vcf.gz  ~/tmps/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr2.vcf.gz  ~/tmps/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools view --force-samples -S list_of_samples.txt -Oz -o ~/try/NEW.chr1.vcf.gz  ~/tmps/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz;
srun bcftools concat -Oz -o ~/try/merged.zcf.gz ~/try/NEW.chr{1..22}.vcf.gz;
srun bcftools index -f -t ~/try/merged.bcf.gz;
