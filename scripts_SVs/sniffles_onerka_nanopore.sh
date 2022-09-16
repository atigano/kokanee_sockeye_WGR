#!/bin/bash
#SBATCH --job-name=sniffles
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 24:00:00
#SBATCH -o logs/%x-%j.out
#SBATCH --cpus-per-task=24
#sbatch scripts/sniffles_onerka.sh MIS29_ST OKAL4_SH

module load StdEnv/2020 sniffles/1.0.12b
#module load ngmlr
#module load nixpkgs/16.09  gcc/4.8.5 samtools/1.9

DATA=$1
cd /home/annat/projects/rrg-mirussel/anna/nanopore/sniffles
ngmlr -t 24 -r /home/annat/projects/rrg-mirussel/anna/reference/onerka.fa -q ../${DATA}_pass.fastq -o ${DATA}_2onerka.sam -x ont
samtools sort ${DATA}_2onerka.sam --threads 24 -o ${DATA}_2onerka.sorted.bam
sniffles -m ${DATA}_2onerka.sorted.bam -v ${DATA}_2onerka.vcf --min_support 3 -t 24
