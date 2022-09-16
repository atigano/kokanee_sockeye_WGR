#!/bin/bash
#SBATCH --job-name=merge
#SBATCH --output=merge.%A_%a.out
#SBATCH --error=merge.%A_%a.err
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#SBATCH --cpus-per-task=6
#SBATCH --array=1-92
#sbatch mergebams_array.sh sample_lists/kokanee_samples.txt

module load samtools

cd /home/annat/projects/rrg-mirussel/anna/
SAMPLELIST=$1
SAMPLE=`cat $SAMPLELIST | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

samtools merge -@6 goodbam/${SAMPLE}.bam goodbam/${SAMPLE}_A.sorted.bam goodbam/${SAMPLE}_B.sorted.bam
samtools index goodbam/${SAMPLE}.bam
