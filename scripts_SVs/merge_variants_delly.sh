#!/bin/bash
#SBATCH --job-name=dellymerge
#SBATCH --mail-type=ALL
#SBATCH --mail-user=annatigano@gmail.com
#SBATCH --mem 110G
#SBATCH --time 1-00:00:00
#SBATCH -o logs/%x-%j.out
#SBATCH --cpus-per-task=1
#sbatch scripts/delly_oka_chr_merge.sh

module load StdEnv/2020 delly/0.8.5
cd $ANNA/variant_calling/batch1/structural_variants/

delly merge -o sv_sites.bcf delly_OKAL_MIS_103_4d.bcf delly_OKAL_MIS_114_4d.bcf delly_OKAL_MIS_118_4d.bcf delly_OKAL_NES_455_4d.bcf delly_OKAL_NES_468_4d.bcf delly_OKAL_NES_469_4d.bcf delly_OKAL_NES_475_4d.bcf delly_OKAL_NWS_449_4d.bcf delly_OKAL_NWS_451_4d.bcf delly_OKAL_NWS_465_4d.bcf delly_OKAL_NWS_472_4d.bcf delly_OKAL_PEA_153_4d.bcf delly_OKAL_PEA_157_4d.bcf delly_OKAL_PEA_158_4d.bcf delly_OKAL_PEN_003_4d.bcf delly_OKAL_PEN_004_4d.bcf delly_OKAL_PEN_006_4d.bcf delly_OKAL_POW_235_4d.bcf delly_OKAL_POW_240_4d.bcf delly_OKAL_POW_249_4d.bcf delly_OKAL_SES_037_4d.bcf delly_OKAL_SES_038_4d.bcf delly_OKAL_SES_041_4d.bcf delly_OKAL_SES_042_4d.bcf delly_OKAR_Sock_101_4d.bcf delly_OKAR_Sock_122_4d.bcf delly_OKAR_Sock_152_4d.bcf delly_OKAR_Sock_173_4d.bcf delly_OKAR_Sock_180_4d.bcf delly_OKAR_Sock_189_4d.bcf delly_OKAR_Sock_191_4d.bcf delly_OKAR_Sock_219_4d.bcf delly_OKAR_Sock_240_4d.bcf delly_OKAR_Sock_302_4d.bcf delly_OKAR_Sock_304_4d.bcf delly_OKAR_Sock_309_4d.bcf 
