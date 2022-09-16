#!/bin/bash
#SBATCH --job-name=angsd_all
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 7-00:00:00
#SBATCH --output=logs/%x-%j.log
#SBATCH --cpus-per-task=6
#sbatch scripts/angsd_kok_batch1_okanagan_all.sh 
cd /home/annat/projects/rrg-mirussel/anna/

module load angsd

angsd -b sample_lists/kokanee_bams_okanagan.txt -anc reference/onerka_chr.fa \
-out variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_all -P 10 -doDepth 1\
-setMaxDepth 2200 -minInd 18 -GL 1 -doMaf 1 -doMajorMinor 1 -minMapQ 20 -minQ 20 -skipTriallelic 1
