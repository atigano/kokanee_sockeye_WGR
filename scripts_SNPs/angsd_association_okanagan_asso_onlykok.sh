
#!/bin/bash
#SBATCH --job-name=angsd_ass_kok
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 3-00:00:00
#SBATCH -o logs/%x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/angsd_association_okanagan_asso_onlykok.sh asso(1,2,4,5,6) spawning/sex
#sbatch scripts/angsd_association_okanagan_asso_onlykok.sh 4 sex
#sbatch scripts/angsd_association_okanagan_asso_onlykok.sh 4 spawning
##### -doAsso 4 without covariance and ONLY IN KOKANEE

module load angsd

TRAIT=$2
ASSO=$1
SITES=variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_snplist.txt

angsd -doAsso ${ASSO} -yBin variant_calling/batch1/angsd/association/${TRAIT}_onlykok.txt \
-b sample_lists/kokanee_bams_okanagan_order_onlykok.txt  -anc reference/onerka_chr.fa \
-out variant_calling/batch1/angsd/association/association_${TRAIT}_oka_asso${ASSO}_onlykok -P 10 \
-sites ${SITES} -GL 1 -doMaf 1 -doMajorMinor 3 -doPost 1 -minHigh 5 -minCount 5
