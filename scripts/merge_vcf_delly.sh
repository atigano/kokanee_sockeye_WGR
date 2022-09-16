#!/bin/bash
#SBATCH --job-name=merge
#SBATCH --output=logs/merge.%A_%a.out
#SBATCH --error=logs/merge.%A_%a.err
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --mem=110GB
#sbatch delly_merge_vcf.sh
module load bcftools
cd /home/annat/projects/rrg-mirussel/anna/variant_calling/batch1/structural_variants
###also in bcf format with 
#bcftools merge -m id -O b -o delly_okanagan_sv.bcf delly_OKAL_MIS_103_list.bcf delly_OKAL_MIS_114_list.bcf delly_OKAL_MIS_118_list.bcf delly_OKAL_NES_455_list.bcf delly_OKAL_NES_468_list.bcf delly_OKAL_NES_469_list.bcf delly_OKAL_NES_475_list.bcf delly_OKAL_NWS_449_list.bcf delly_OKAL_NWS_451_list.bcf delly_OKAL_NWS_465_list.bcf delly_OKAL_NWS_472_list.bcf delly_OKAL_PEA_153_list.bcf delly_OKAL_PEA_157_list.bcf delly_OKAL_PEA_158_list.bcf delly_OKAL_PEN_003_list.bcf delly_OKAL_PEN_004_list.bcf delly_OKAL_PEN_006_list.bcf delly_OKAL_POW_235_list.bcf delly_OKAL_POW_240_list.bcf delly_OKAL_POW_249_list.bcf delly_OKAL_SES_037_list.bcf delly_OKAL_SES_038_list.bcf delly_OKAL_SES_041_list.bcf delly_OKAL_SES_042_list.bcf delly_OKAR_Sock_101_list.bcf delly_OKAR_Sock_122_list.bcf delly_OKAR_Sock_152_list.bcf delly_OKAR_Sock_173_list.bcf delly_OKAR_Sock_180_list.bcf delly_OKAR_Sock_189_list.bcf delly_OKAR_Sock_191_list.bcf delly_OKAR_Sock_219_list.bcf delly_OKAR_Sock_240_list.bcf delly_OKAR_Sock_302_list.bcf delly_OKAR_Sock_304_list.bcf delly_OKAR_Sock_309_list.bcf

bcftools merge -m id -O v -o delly_okanagan_sv.vcf delly_OKAL_MIS_103_list.bcf delly_OKAL_MIS_114_list.bcf delly_OKAL_MIS_118_list.bcf delly_OKAL_NES_455_list.bcf delly_OKAL_NES_468_list.bcf delly_OKAL_NES_469_list.bcf delly_OKAL_NES_475_list.bcf delly_OKAL_NWS_449_list.bcf delly_OKAL_NWS_451_list.bcf delly_OKAL_NWS_465_list.bcf delly_OKAL_NWS_472_list.bcf delly_OKAL_PEA_153_list.bcf delly_OKAL_PEA_157_list.bcf delly_OKAL_PEA_158_list.bcf delly_OKAL_PEN_003_list.bcf delly_OKAL_PEN_004_list.bcf delly_OKAL_PEN_006_list.bcf delly_OKAL_POW_235_list.bcf delly_OKAL_POW_240_list.bcf delly_OKAL_POW_249_list.bcf delly_OKAL_SES_037_list.bcf delly_OKAL_SES_038_list.bcf delly_OKAL_SES_041_list.bcf delly_OKAL_SES_042_list.bcf delly_OKAR_Sock_101_list.bcf delly_OKAR_Sock_122_list.bcf delly_OKAR_Sock_152_list.bcf delly_OKAR_Sock_173_list.bcf delly_OKAR_Sock_180_list.bcf delly_OKAR_Sock_189_list.bcf delly_OKAR_Sock_191_list.bcf delly_OKAR_Sock_219_list.bcf delly_OKAR_Sock_240_list.bcf delly_OKAR_Sock_302_list.bcf delly_OKAR_Sock_304_list.bcf delly_OKAR_Sock_309_list.bcf

delly filter -f germline -o delly_okanagan_sv_filtered.bcf delly_okanagan_sv.bcf
