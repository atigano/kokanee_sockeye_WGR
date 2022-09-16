#!/bin/bash
#SBATCH --job-name=sort
#SBATCH --output=sort.%A_%a.out
#SBATCH --error=sort.%A_%a.err
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#SBATCH --cpus-per-task=6
#SBATCH --array=1-92
#sbatch sortindex_array.sh kokanee_samples_a.txt or kokanee_samples_b.txt

module load samtools


cd /home/annat/projects/rrg-mirussel/anna
SAMPLELIST=$1
SAMPLE=`cat $SAMPLELIST | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

samtools view -F 0x4 -b bamfiles/$SAMPLE.bam | samtools sort -@6 - -o goodbam/$SAMPLE.sorted.bam

samtools index goodbam/$SAMPLE.sorted.bam
