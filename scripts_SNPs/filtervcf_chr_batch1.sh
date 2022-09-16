#!/bin/bash
#SBATCH --job-name=filterVcf
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 20G
#SBATCH --time 12:00:00
#SBATCH -o %x-%j.log
#SBATCH --cpus-per-task=1
#SBATCH --array=1-30
#sbatch scripts/filtervcf_chr_batch1.sh 
cd /home/annat/projects/rrg-mirussel/anna/

REGION=`cat reference/onerka_chrlist.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`
OUTPUTPATH="variant_calling/batch1/bcftools"

module load bcftools
module load vcftools

bcftools filter -e 'MQ < 30' "$OUTPUTPATH"/kokanee_batch1_"$REGION".vcf -Ov > "$OUTPUTPATH"/kokanee_batch1_"$REGION"_filtered.tmp.vcf
grep -v ^\#\# "$OUTPUTPATH"/kokanee_batch1_"$REGION"_filtered.tmp.vcf | wc -l  #28437836


echo "
>>> Filtering through VCFtools now!!
"
vcftools --vcf "$OUTPUTPATH"/kokanee_batch1_"$REGION"_filtered.tmp.vcf \
    --minQ 30 \
    --minGQ 20 \
    --minDP 3 \
    --mac 2 \
    --max-alleles 2 \
    --max-missing 0.7 \
    --maf 0.05 \
    --recode \
    --stdout > "$OUTPUTPATH"/kokanee_batch1_"$REGION"_filtered.vcf
