#!/bin/bash
#SBATCH --job-name=angsd_pop
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 3-00:00:00
#SBATCH --output=%x-%j.log
#SBATCH --cpus-per-task=6

#sbatch scripts/angsd_kok_okanagan_pop_n.sh POP (stream, shore, sockeye)
cd /home/annat/projects/rrg-mirussel/anna/


POP=$1

SITES=variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_snplist.txt
module load angsd

angsd -b sample_lists/kokanee_bams_okanagan_${POP}.txt -anc reference/onerka_chr.fa \
-out variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_${POP}_n -P 10 \
-setMaxDepth 1200 -minInd 6 -GL 1 -doMaf 1 -doMajorMinor 3 -doCounts 1 -doDepth 1 -sites ${SITES} -minMapQ 20 -minQ 20 
