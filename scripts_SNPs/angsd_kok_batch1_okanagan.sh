#!/bin/bash
#SBATCH --job-name=angsd_chr
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 1-00:00:00
#SBATCH --output=angsd_chr_oka.%A_%a.out
#SBATCH --cpus-per-task=6
#SBATCH --array=1-30
#sbatch scripts/angsd_kok_batch1_okanagan.sh
cd /home/annat/projects/rrg-mirussel/anna/

REGION=`cat reference/onerka_chrlist.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

module load angsd

angsd -b sample_lists/kokanee_bams_okanagan.txt -anc reference/onerka.fa \
-r "$REGION": \
-out variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_"$REGION" -P 10 \
-uniqueOnly 1 -remove_bads 1 -SNP_pval 1e-6 -minMapQ 20 -minQ 20 \
-setMinDepth 30 -setMaxDepth 2200 -minInd 18 -GL 1 -doMaf 1 -doMajorMinor 1 -doCounts 1 -skipTriallelic 1
