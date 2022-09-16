#!/bin/bash
#SBATCH --job-name=angsd_fst
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 40G
#SBATCH --time 6:00:00
#SBATCH -o %x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/angsd_fst_oka_pop.sh 

module load angsd
cd /home/annat/projects/rrg-mirussel/anna/variant_calling/batch1/angsd
POP1=stream
POP2=shore
POP3=sockeye

# Generate the 2dSFS to be used as a prior for Fst estimation (and individual plots)
realSFS angsd_kok_batch1_okanagan_${POP1}.saf.idx angsd_kok_batch1_okanagan_${POP2}.saf.idx > ${POP1}_${POP2}.2dsfs
realSFS angsd_kok_batch1_okanagan_${POP1}.saf.idx angsd_kok_batch1_okanagan_${POP3}.saf.idx > ${POP1}_${POP3}.2dsfs
realSFS angsd_kok_batch1_okanagan_${POP2}.saf.idx angsd_kok_batch1_okanagan_${POP3}.saf.idx > ${POP2}_${POP3}.2dsfs

# Estimating Fst in angsd
realSFS fst index angsd_kok_batch1_okanagan_${POP1}.saf.idx angsd_kok_batch1_okanagan_${POP2}.saf.idx -sfs ${POP1}_${POP2}.2dsfs -fstout ${POP1}_${POP2}.alpha_beta
realSFS fst index angsd_kok_batch1_okanagan_${POP1}.saf.idx angsd_kok_batch1_okanagan_${POP3}.saf.idx -sfs ${POP1}_${POP3}.2dsfs -fstout ${POP1}_${POP3}.alpha_beta
realSFS fst index angsd_kok_batch1_okanagan_${POP2}.saf.idx angsd_kok_batch1_okanagan_${POP3}.saf.idx -sfs ${POP2}_${POP3}.2dsfs -fstout ${POP2}_${POP3}.alpha_beta

realSFS fst print ${POP1}_${POP2}.alpha_beta.fst.idx > ${POP1}_${POP2}.alpha_beta.txt
realSFS fst print ${POP1}_${POP3}.alpha_beta.fst.idx > ${POP1}_${POP3}.alpha_beta.txt
realSFS fst print ${POP2}_${POP3}.alpha_beta.fst.idx > ${POP2}_${POP3}.alpha_beta.txt

echo -e 'chr\tpos\talpha\tbeta\tfst' > ${POP1}_${POP2}.fst
echo -e 'chr\tpos\talpha\tbeta\tfst' > ${POP1}_${POP3}.fst
echo -e 'chr\tpos\talpha\tbeta\tfst' > ${POP2}_${POP3}.fst

awk '($4 != 0){ print $0 "\t" $3 / $4 }' ${POP1}_${POP2}.alpha_beta.txt >> ${POP1}_${POP2}.fst
awk '($4 != 0){ print $0 "\t" $3 / $4 }' ${POP1}_${POP3}.alpha_beta.txt >> ${POP1}_${POP3}.fst
awk '($4 != 0){ print $0 "\t" $3 / $4 }' ${POP2}_${POP3}.alpha_beta.txt >> ${POP2}_${POP3}.fst

realSFS fst stats2 ${POP1}_${POP2}.alpha_beta.fst.idx -win 50000 -step 50000 -type 2 > ${POP1}_${POP2}_50kb.fst
realSFS fst stats2 ${POP1}_${POP3}.alpha_beta.fst.idx -win 50000 -step 50000 -type 2 > ${POP1}_${POP3}_50kb.fst
realSFS fst stats2 ${POP2}_${POP3}.alpha_beta.fst.idx -win 50000 -step 50000 -type 2 > ${POP2}_${POP3}_50kb.fst

realSFS fst stats2 ${POP1}_${POP2}.alpha_beta.fst.idx -win 10000 -step 10000 -type 2 > ${POP1}_${POP2}_10kb.fst
realSFS fst stats2 ${POP1}_${POP3}.alpha_beta.fst.idx -win 10000 -step 10000 -type 2 > ${POP1}_${POP3}_10kb.fst
realSFS fst stats2 ${POP2}_${POP3}.alpha_beta.fst.idx -win 10000 -step 10000 -type 2 > ${POP2}_${POP3}_10kb.fst


tail -n +2 stream_shore.fst | awk '{ sum1 += $3;sum2 += $4 } END { print sum1/sum2 }'
0.0158487
tail -n +2 stream_sockeye.fst | awk '{ sum1 += $3;sum2 += $4 } END { print sum1/sum2 }'
0.0774536
tail -n +2 shore_sockeye.fst | awk '{ sum1 += $3;sum2 += $4 } END { print sum1/sum2 }'
0.0846433
