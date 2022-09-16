#!/bin/bash
#SBATCH --job-name=fastp
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 16:00:00
#SBATCH -o %x-%j.out
#sbatch fastp.sh kokanee_samples_a.txt or kokanee_samples_b.txt
###split samples in 4 files otherwise it runs out of time, next time do it with an array silly!
module load fastp

cd /home/annat/projects/rrg-mirussel/anna

SAMPLELIST=$1
for SAMPLE in `cat $SAMPLELIST`; do

fastp -i renamed/${SAMPLE}_1.fastq.gz -I renamed/${SAMPLE}_2.fastq.gz -o trimmed/${SAMPLE}_trimmed_1.fastq.gz -O trimmed/${SAMPLE}_trimmed_2.fastq.gz --adapter_sequence AAGTCGGAGGCCAAGCGGTCTTAGGAAGACAA --adapter_sequence_r2 AAGTCGGATCGTAGCCATGTCGTTCTGTGAGCCAAGGAGTTG -G -h ${SAMPLE}.html

done
