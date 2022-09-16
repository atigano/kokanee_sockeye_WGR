#!/bin/bash
#SBATCH --job-name=dellygeno
#SBATCH --output=logs/delly.%A_%a.out
#SBATCH --error=logs/delly.%A_%a.err
#SBATCH --time=4-00:00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#SBATCH --cpus-per-task=1
#SBATCH --array=1-36
#sbatch scripts/delly_oka_chr_geno.sh

module load StdEnv/2020 delly/0.8.5

cd $ANNA
SAMPLE=`cat sample_lists/kokanee_samples_okanagan.txt | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

delly call -g $ANNA/reference/onerka.fa -v sv_sites.bcf -x $ANNA/reference/scaffold_exclude -o $ANNA/variant_calling/batch1/structural_variants/delly_${SAMPLE}_list.bcf  $ANNA/goodbam/${SAMPLE}.bam 
