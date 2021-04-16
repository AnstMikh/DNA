#!/bin/bash
#
#SBATCH --job-name=aDNA
#SBATCH --output=run.log
#
#SBATCH --ntasks=1
#SBATCH --array=0-7

module load Python/Anaconda_v10.2019
source activate p2
ARGS=(44 45 46 47 48 49 50)
srun bcftools mpileup -q 20 -Q 30 -f /home/anastasia.mikhailova/data/human_g1k_37/human_g1k_v37.fasta /home/anastasia.mikhailova/ncbi/public/lindo_bam/sorted_SRR81446${ARGS[$SLURM_ARRAY_TASK_ID]}.bam | bcftools call -mv > ~/lindo.mpileup

