#!/bin/bash
#SBATCH --job-name=dxy
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 40G
#SBATCH --time 6:00:00
#SBATCH -o logs/%x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/dxy_win.sh 
###dxy_win.sh

#sbatch scripts/dxy_win.sh $ANNA/reference/onerka.fa 50 shore stream
#sbatch scripts/dxy_win.sh $ANNA/reference/onerka.fa 50 shore sockeye
#sbatch scripts/dxy_win.sh $ANNA/reference/onerka.fa 50 stream sockeye

GENOME=$1 # reference genome e.g. onerka.fasta
WIN=$2 # window size in kb e.g. 10
POP1=$3 # 
POP2=$4 # 


cd /home/annat/projects/rrg-mirussel/anna/variant_calling/batch1/angsd/

#if [ ! -s onerka_windows_$WINk.bed ]; then
#    bedtools makewindows -g $GENOME'.fai' -w $WIN'000' | awk '$3 ~ /0000$/' | sed 's/ /\t/g' > 'genome_windows_'$WIN'k.bed'

#fi

tail -n +2 'dxy_'$POP1'_'$POP2'_site.txt' > 'dxy_'$POP1'_'$POP2'_site_noheader.txt'

tail -n +2 'dxy_'$POP1'_'$POP2'_site.txt' | cut -f2,3 | awk '{$1 = $1 + 1; print}' | paste 'dxy_'$POP1'_'$POP2'_site_noheader.txt' - | awk 'BEGIN {FS="\t"};{ print $1"\t"$2"\t"$4"\t"$3}' | sed 's/ //g'> 'dxy_'$POP1'_'$POP2'_siteInterval.bed'

bedtools map -a 'onerka_windows_'$WIN'k.bed' -b 'dxy_'$POP1'_'$POP2'_siteInterval.bed' -c 4 -o sum > 'dxy_'$POP1'_'$POP2'_'$WIN'kwin.txt'



