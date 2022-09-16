#!/bin/bash
#SBATCH --job-name=BWA_MEM
#SBATCH --output=BWA_MEM.%A_%a.out
#SBATCH --error=BWA_MEM.%A_%a.err
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#SBATCH --cpus-per-task=6
#SBATCH --array=1-92
#sbatch bwa_array.sh kokanee_samples_a.txt or kokanee_samples_b.txt

module load bwa
module load samtools
module load samblaster

cd /home/annat/projects/rrg-mirussel/anna
SAMPLELIST=$1
SAMPLE=`cat $SAMPLELIST | head -n $SLURM_ARRAY_TASK_ID | tail -n 1`

bwa mem -t 6 reference/onerka.fa \
trimmed/${SAMPLE}_trimmed_1.fastq.gz \
trimmed/${SAMPLE}_trimmed_2.fastq.gz \
| samblaster --removeDups | samtools view -S -h -b -@6 -o bamfiles/${SAMPLE}.bam
