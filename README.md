## Pipeline from sra|bam|vcf to plink
### Step by step instruction
#####   1) Ancient part: run pseudo.sh firstly then build_pseudo_ancient.sh
#####   2) Modern part: run create_new_chr.sh then fix_mapuche_files.sh then make_lindo.sh
#####   3) For finishing preparing the data for pca analysis run merge_all.sh then run LD_pca.sh
### P.s. firstly, you have to download files in sra, bam or vcf format, then follow the instruction. If you have any problems with matching allels of your file with the reference one then run correct_columns.sh
