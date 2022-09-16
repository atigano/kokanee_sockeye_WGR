library(data.table)
library(tidyverse)
sockeye_mafs<-fread("angsd_kok_batch1_okanagan_sockeye_n.mafs", header = TRUE)
shore_mafs<-fread("angsd_kok_batch1_okanagan_shore_n.mafs", header = TRUE)
stream_mafs<-fread("angsd_kok_batch1_okanagan_stream_n.mafs", header = TRUE)

kokanee_mafs<-full_join(shore_mafs, stream_mafs, by = c("chromo" , "position"))
all_mafs<-full_join(sockeye_mafs,kokanee_mafs, by = c("chromo" , "position"))

all_mafs_clean<-all_mafs[,c('chromo','position','knownEM','knownEM.x','knownEM.y','nInd','nInd.x','nInd.y')]
setnames(all_mafs_clean, old = c('knownEM','knownEM.x', 'knownEM.y','nInd','nInd.x','nInd.y'), new = c('sockeye','shore','stream','n_sockeye','n_shore','n_stream'))

###Fixed between sockeye and kokanee
all_mafs_clean[shore == 1 & stream == 1 & sockeye == 0] #zero
all_mafs_clean[shore == 0 & stream == 0 & sockeye == 1] #zero
fixed1<-all_mafs_clean[shore == 1  & sockeye == 0]
fixed2<-all_mafs_clean[shore == 0  & sockeye == 1]
fixed<-rbind(fixed1,fixed2)
###Fixed between shore and stream
all_mafs_clean[stream == 1 & shore == 0]
all_mafs_clean[stream == 0 & shore == 1]

###Fixed between sockeye and kokanee with no missing data
all_mafs_n<-all_mafs_clean[n_sockeye == 12 & n_shore == 12 & n_stream == 12]
all_mafs_n[shore == 1 & stream == 1 & sockeye == 0] #zero
all_mafs_n[shore == 0 & stream == 0 & sockeye == 1] #zero
fixed1_n<-all_mafs_n[shore == 1  & sockeye == 0] #201
fixed2_n<-all_mafs_n[shore == 0  & sockeye == 1] #44
fixed_n<-rbind(fixed1_n,fixed2_n) #245
###Fixed between shore and stream
all_mafs_n[stream == 1 & shore == 0]
all_mafs_n[stream == 0 & shore == 1]

all_mafs_n$delta<-all_mafs_n$sockeye-all_mafs_n$shore
alm_fixed1_n<-all_mafs_n[delta > 0.9] #819
alm_fixed2_n<-all_mafs_n[delta < -0.9] #536
alm_fixed_n<-rbind(alm_fixed1_n,alm_fixed2_n) 

###normalized frequencies
alm_fixed2_n_nor<- alm_fixed2_n
alm_fixed2_n_nor$sockeye_nor<- 1- alm_fixed2_n_nor$sockeye
alm_fixed2_n_nor$stream_nor<- 1- alm_fixed2_n_nor$stream
alm_fixed2_n_nor$shore_nor<- 1- alm_fixed2_n_nor$shore

alm_fixed1_n_nor<- alm_fixed1_n
alm_fixed1_n_nor$sockeye_nor<- alm_fixed1_n_nor$sockeye
alm_fixed1_n_nor$stream_nor<- alm_fixed1_n_nor$stream
alm_fixed1_n_nor$shore_nor<- alm_fixed1_n_nor$shore

alm_fixed_n_nor<-rbind(alm_fixed1_n_nor,alm_fixed2_n_nor) 
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042535.1"] <- 1
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042536.1"] <- 2
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042537.1"] <- 3
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042538.1"] <- 4
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042539.1"] <- 5
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042540.1"] <- 6
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042541.1"] <- 7
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042542.1"] <- 8
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042543.1"] <- 9
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042544.1"] <- 10
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042545.1"] <- 11
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042546.1"] <- 12
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042547.1"] <- 13
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042548.1"] <- 14
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042549.1"] <- 15
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042550.1"] <- 16
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042551.1"] <- 17
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042552.1"] <- 18
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042553.1"] <- 19
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042554.1"] <- 20
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042555.1"] <- 21
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042556.1"] <- 22
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042557.1"] <- 23
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042558.1"] <- 24
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042559.1"] <- 25
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042560.1"] <- 26
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042561.1"] <- 27
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042562.1"] <- 28
alm_fixed_n_nor$chr_fix[alm_fixed_n_nor$chromo== "NC_042563.1"] <- 29
alm_fixed_n_nor$pos<-alm_fixed_n_nor$position/1000000

###plot 'nearly fixed differences' all chromosome
almost_fixed_plot_allchr<-ggplot(data=alm_fixed_n_nor,aes(pos,sockeye_nor)) + geom_point(col="#1a759f", alpha=0.5) +
  geom_point(aes(pos, shore_nor), col="#e80000", alpha=0.5) +
  geom_point(aes(pos, stream_nor), col="#fecb02", alpha=0.5) + 
  theme_bw() + ggtitle("Frequency of 'nearly fixed' differences between shore kokanee and sockeye")+  ylab("Allele frequencies")+ xlab("position (Mb)") + 
  facet_wrap(~chr_fix, nrow=6) +theme(strip.background = element_blank(),plot.title = element_text(hjust = 0.5)) ###9x8 inches

### plot zoomed in on each of the three AODs
alm_fixed_n_nor<-fread("almost_fixed_SNPs_shore_sockeye_norm.txt", header=TRUE)
gff<-fread("onerka_chr_light.bed", header=TRUE)
gene_gff<- gff%>%
  filter(gene== "gene")
exon_gff<- gff%>%
  filter(gene== "exon")

div=1000000
af_12zoom_data<-
  alm_fixed_n_nor %>%
  filter(chr_fix == 12) %>%
  filter(position>41136052 & position <41377306)

theme_update(plot.title = element_text(hjust = 0.5))  

af_12zoom_plot<-
  ggplot() + geom_point(data=af_12zoom_data,aes(position/div,sockeye_nor),col="#1a759f", alpha=0.5) +
  geom_point(data=af_12zoom_data,aes(position/div, shore_nor), col="#e80000", alpha=0.5) +
  geom_point(data=af_12zoom_data,aes(position/div, stream_nor), col="#fecb02", alpha=0.5) + 
  geom_rect(data=subset(gene_gff, chrom=="NC_042546.1"),aes(xmin=start/div, xmax=end/div, ymin=0.49, ymax=0.51), fill="lightgrey", alpha=0.8) +
  geom_rect(data=subset(exon_gff, chrom=="NC_042546.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), fill="darkgrey") +
  geom_rect(data=subset(gene_gff, chrom=="NC_042546.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), col="black", fill=NA, size=0.2) +
  theme_bw() + ggtitle("12")+  xlab("position (Mb)") +ylab("") +  xlim(41136052/div,41377306/div) + theme(plot.title = element_text(hjust = 0.5))
  

af_20zoom_data<-
  alm_fixed_n_nor %>%
  filter(chr_fix == 20) %>%
  filter(position>45396219 & position <45557637)


af_20zoom_plot<-ggplot() + geom_point(data=af_20zoom_data,aes(position/div,sockeye_nor),col="#1a759f", alpha=0.5) +
  geom_point(data=af_20zoom_data,aes(position/div, shore_nor), col="#e80000", alpha=0.5) +
  geom_point(data=af_20zoom_data,aes(position/div, stream_nor), col="#fecb02", alpha=0.5) + 
  geom_rect(data=subset(gene_gff, chrom=="NC_042554.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), fill="lightgrey", alpha=0.8) +
  geom_rect(data=subset(exon_gff, chrom=="NC_042554.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), fill="darkgrey") +
  geom_rect(data=subset(gene_gff, chrom=="NC_042554.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), col="black", fill=NA, size=0.2) +
  theme_bw() + ggtitle("20") + ylab("") + xlab("") + xlim(45394689/div,45582024/div)+ theme(plot.title = element_text(hjust = 0.5))

  


af_7zoom_data<-
  alm_fixed_n_nor %>%
  filter(chr_fix == 7) %>%
  filter(position>13212442 & position <13319291)

af_7zoom_plot<-ggplot() + geom_point(data=af_7zoom_data,aes(position/div,sockeye_nor),col="#1a759f", alpha=0.5) +
  geom_point(data=af_7zoom_data,aes(position/div, shore_nor), col="#e80000", alpha=0.5) +
  geom_point(data=af_7zoom_data,aes(position/div, stream_nor), col="#fecb02", alpha=0.5) + 
  geom_rect(data=subset(gene_gff, chrom=="NC_042541.1"),aes(xmin=start/div, xmax=end/div, ymin=0.49, ymax=0.51), fill="lightgrey", alpha=0.8) +
  geom_rect(data=subset(exon_gff, chrom=="NC_042541.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), fill="darkgrey") +
  geom_rect(data=subset(gene_gff, chrom=="NC_042541.1"),aes(xmin=start/div, xmax=end/div, ymin=0.48, ymax=0.52), col="black", fill=NA, size=0.2) +
  theme_bw() + ggtitle("7")+  ylab("Allele frequencies") + xlab("") + xlim(13149054/div,13386745/div)+ theme(plot.title = element_text(hjust = 0.5))

