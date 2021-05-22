#!/bin/sh
	
#SBATCH --job-name=weight
#SBATCH --output=rrun.log
#SBATCH --error=errr.err
#SBATCH --ntasks=1
	
module load Python/Anaconda_v10.2019
source activate p2
cd ~/plink/wight
srun plink --vcf ~/data.vcf.gz --double-id --vcf-half-call m --chr 1-22 --make-bed --out data
srun plink --bfile data --indep-pairwise 50 10 .5 --chr 1-22 --geno 0.98 --snps-only  --maf 0.05 --out ~/plink/light_data
srun plink --bfile data --extract ~/plink/light_data.prune.in --make-bed --out light_data
srun plink --bfile data --pca --out data
