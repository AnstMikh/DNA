#!/bin/sh
#
#SBATCH --job-name=aDNA
#SBATCH --output=run.log
#SBATCH --error=error.err
#SBATCH --ntasks=1

module load Python/Anaconda_v10.2019
source activate p2
module load angsd/v0.933
srun angsd -bam bam.filelist -out ~/norm_pseudo -doBcf 1 -GL 1 -minMapQ 30 -minQ 20 -dogeno 20 -docounts 1 -doMajorMinor 1 -doMaf 1 -dopost 1 -minmaf 0.05
