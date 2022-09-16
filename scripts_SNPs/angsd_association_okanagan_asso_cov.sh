
#!/bin/bash
#SBATCH --job-name=angsd_ass_cov
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 3-00:00:00
#SBATCH -o logs/%x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/angsd_association_okanagan_asso_cov.sh asso(1,2,4,5,6) migration/spawning
#sbatch scripts/angsd_association_okanagan_asso_cov.sh 4 migration
#sbatch scripts/angsd_association_okanagan_asso_cov.sh 4 spawning
#sbatch scripts/angsd_association_okanagan_asso_cov.sh 4 sex

module load angsd

TRAIT=$2
ASSO=$1
SITES=variant_calling/batch1/angsd/angsd_kok_batch1_okanagan_snplist.txt
cd $ANNA
angsd -doAsso ${ASSO} -yBin variant_calling/batch1/angsd/association/${TRAIT}.txt \
-b sample_lists/kokanee_bams_okanagan_order.txt -anc reference/onerka_chr.fa \
-out variant_calling/batch1/angsd/association/association_${TRAIT}_oka_asso${ASSO}_cov -P 10 \
-sites ${SITES} -GL 1 -doMaf 1 -doMajorMinor 3 -doPost 1 -cov variant_calling/batch1/angsd/association/cov_matrix_okanagan_pc12.txt -minCount 5 -minHigh 5 -Pvalue 1 -model 1
