#!/bin/bash

mkdir -p NA12878_1x_vcf;
for i in {1..2}; do
bcftools view -G -m 2 -M 2 -v snps reference_panel/1000GP.chr${i}.noNA12878.bcf -Oz -o reference_panel/1000GP.chr${i}.noNA12878.sites.vcf.gz;
bcftools index -f reference_panel/1000GP.chr${i}.noNA12878.sites.vcf.gz; 


bcftools query -f'%CHROM\t%POS\t%REF,%ALT\n' reference_panel/1000GP.chr${i}.noNA12878.sites.vcf.gz | bgzip -c > reference_panel/1000GP.chr${i}.noNA12878.sites.tsv.gz;

tabix -s1 -b2 -e2 reference_panel/1000GP.chr${i}.noNA12878.sites.tsv.gz;

BAM=NA12878_1x_bam/NA12878.chr${i}.1x.bam;
VCF=reference_panel/1000GP.chr${i}.noNA12878.sites.vcf.gz;
TSV=reference_panel/1000GP.chr${i}.noNA12878.sites.tsv.gz;
REFGEN=reference_genome/human_g1k_v37.chr${i}.fasta.gz;
OUT=NA12878_1x_vcf/NA12878.chr${i}.1x.vcf.gz;

bcftools mpileup -f ${REFGEN} -I -E -a 'FORMAT/DP' -T ${VCF} -r chr22 ${BAM} -Ou | bcftools call -Aim -C alleles -T ${TSV} -Oz -o ${OUT};
bcftools index -f ${OUT};

bin/GLIMPSE_chunk --input reference_panel/1000GP.chr${i}.noNA12878.sites.vcf.gz --region chr${i} --window-size 1000000 --buffer-size 200000 --output chunks.chr${i}.txt;


mkdir -p GLIMPSE_impute;

VCF=NA12878_1x_vcf/NA12878.chr${i}.1x.vcf.gz;
REF=reference_panel/1000GP.chr${i}.noNA12878.bcf;
MAP=../maps/genetic_maps.b37/chr${i}.b37.gmap.gz;

while IFS="" read -r LINE || [ -n "$LINE" ]; 
do   
	printf -v ID "%02d" $(echo $LINE | cut -d" " -f1)
	IRG=$(echo $LINE | cut -d" " -f3)
	ORG=$(echo $LINE | cut -d" " -f4)
	OUT=GLIMPSE_impute/NA12878.chr${i}.imputed.${ID}.bcf
	bin/GLIMPSE_phase --input ${VCF} --reference ${REF} --map ${MAP} --input-region ${IRG} --output-region ${ORG} --output ${OUT}
	bcftools index -f ${OUT}
done < chunks.chr${i}.txt;

mkdir -p GLIMPSE_ligate;
LST=GLIMPSE_ligate/list.chr${i}.txt;
ls GLIMPSE_impute/NA12878.chr${i}.imputed.*.bcf > ${LST};

OUT=GLIMPSE_ligate/NA12878.chr22.merged.bcf;

bin/GLIMPSE_ligate --input ${LST} --output $OUT;
bcftools index -f ${OUT};

mkdir -p GLIMPSE_sample;
VCF=GLIMPSE_ligate/NA12878.chr${i}.merged.bcf;

OUT=GLIMPSE_sample/NA12878.chr${i}.sampled.bcf;

bin/GLIMPSE_sample --input ${VCF} --solve --output ${OUT};
bcftools index -f ${OUT};

mkdir -p GLIMPSE_concordance;

./bin/GLIMPSE_concordance --input concordance.lst --minDP 8 --output GLIMPSE_concordance/output --minPROB 0.9999 --bins 0.00000 0.00100 0.00200 0.00500 0.01000 0.05000 0.10000 0.20000 0.50000 --thread 4;

cd plot;
./concordance_plot.py;


