#!/bin/bash
#SBATCH --job-name=bcftools_chr
#SBATCH --output=bcftools_chr.%A_%a.out
#SBATCH --error=bcftools_chr.%A_%a.err
#SBATCH --time=1-00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#SBATCH --cpus-per-task=1
#SBATCH --array=1-30
#sbatch scripts/bcftools_chr_batch1.sh 
module load bcftools

cd /home/annat/projects/rrg-mirussel/anna/

REGION=`cat reference/onerka_chrlist.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`
GENOME="reference/onerka.fa"
OUTPUTPATH="variant_calling/batch1/bcftools"
BAM="sample_lists/kokanee_bams_duplicate.txt"

bcftools mpileup -Ou -f $GENOME -b $BAM -q 5 -r $REGION -I -a AD,DP,SP,ADF,ADR -d 200 | bcftools call -G - -mv -Ov > "$OUTPUTPATH"/kokanee_batch1_"$REGION".vcf
