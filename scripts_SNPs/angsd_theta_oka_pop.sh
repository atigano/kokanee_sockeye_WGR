#!/bin/bash
#SBATCH --job-name=angsd_pca
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 40G
#SBATCH --time 6:00:00
#SBATCH -o %x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/angsd_theta_oka_pop.sh pop (shore, stream, sockeye)

POP=$1

module load angsd
cd /home/annat/projects/rrg-mirussel/anna/variant_calling/batch1/angsd
# .saf files already produced with angsd_peer_global_noout.sh
#a. Obtain the maximum likelihood estimate of the SFS using the realSFS program, folded spectrum because I'm not sure I have the ancestral state
realSFS angsd_kok_batch1_okanagan_${POP}.saf.idx -P 24 -fold 1 > angsd_kok_batch1_okanagan_folded_${POP}.sfs

#b. Calculate the thetas for each site (new method)
realSFS saf2theta angsd_kok_batch1_okanagan_${POP}.saf.idx -sfs angsd_kok_batch1_okanagan_folded_${POP}.sfs -outname angsd_kok_batch1_okanagan_folded_${POP}

#c. Estimate Tajimas D and other statistics
thetaStat do_stat angsd_kok_batch1_okanagan_folded_${POP}.thetas.idx
thetaStat do_stat angsd_kok_batch1_okanagan_folded_${POP}.thetas.idx -win 50000 -step 50000 -outnames angsd_kok_batch1_okanagan_folded_${POP}_50kb -nChr 24 -type 2
