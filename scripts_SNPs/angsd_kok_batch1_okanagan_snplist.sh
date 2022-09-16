#!/bin/bash
#SBATCH --job-name=angsd
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 3-00:00:00
#SBATCH --output=logs/%x-%j.log
#SBATCH --cpus-per-task=6
#sbatch scripts/angsd_kok_batch1_okanagan_snplist.sh 
cd /home/annat/projects/rrg-mirussel/anna/

SITES=variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_snplist.txt
module load angsd

angsd -b sample_lists/kokanee_bams_okanagan.txt -anc reference/onerka.fa \
-out variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_snplist -P 10 \
-setMaxDepth 2200 -minInd 18 -GL 1 -doMaf 1 -doMajorMinor 3 -doGlf 2 -doPost 1 -doBcf 1 -doCounts 1 -doDepth 1 -dosaf 1 -sites ${SITES} -minMapQ 20 -minQ 20 \
--ignore-RG 0 -dogeno 32
