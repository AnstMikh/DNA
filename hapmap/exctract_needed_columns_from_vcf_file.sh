#!/bin/sh


module load Python/Anaconda_v10.2019
source activate p2
srun bcftools view --force-samples -S yri.txt -Oz -o yri.vcf.gz human_37.vcf.gz
srun bcftools index -tf yri.vcf.gz
srun bcftools query -f '%CHROM\t%POS\t%ID\n' yri.vcf.gz > gen.yri.txt
