setwd("~/Dropbox/postdoc UBC/analyses_kokanee")

####These analysis are based on sites that are segregating ine ach of the three ecotypes
library(data.table)
library(tidyverse)
alm_fixed<-fread("almost_fixed_SNPs_shore_sockeye_norm.txt", header=TRUE)

alm_fixed$chr_fix[alm_fixed$chromo== "NC_042535.1"] <- 1
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042536.1"] <- 2
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042537.1"] <- 3
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042538.1"] <- 4
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042539.1"] <- 5
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042540.1"] <- 6
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042541.1"] <- 7
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042542.1"] <- 8
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042543.1"] <- 9
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042544.1"] <- 10
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042545.1"] <- 11
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042546.1"] <- 12
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042547.1"] <- 13
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042548.1"] <- 14
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042549.1"] <- 15
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042550.1"] <- 16
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042551.1"] <- 17
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042552.1"] <- 18
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042553.1"] <- 19
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042554.1"] <- 20
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042555.1"] <- 21
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042556.1"] <- 22
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042557.1"] <- 23
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042558.1"] <- 24
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042559.1"] <- 25
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042560.1"] <- 26
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042561.1"] <- 27
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042562.1"] <- 28
alm_fixed$chr_fix[alm_fixed$chromo== "NC_042563.1"] <- 29
setnames(alm_fixed, old = c('chromo'), new = c('chr'))

size<-fread("onerka_chrsize.txt", header=TRUE)
fst_peaks<-fread("summary_fst_peaks_win.txt", header=TRUE)
fst_peaks$chr_fix[fst_peaks$chr== "NC_042535.1"] <- 1
fst_peaks$chr_fix[fst_peaks$chr== "NC_042536.1"] <- 2
fst_peaks$chr_fix[fst_peaks$chr== "NC_042537.1"] <- 3
fst_peaks$chr_fix[fst_peaks$chr== "NC_042538.1"] <- 4
fst_peaks$chr_fix[fst_peaks$chr== "NC_042539.1"] <- 5
fst_peaks$chr_fix[fst_peaks$chr== "NC_042540.1"] <- 6
fst_peaks$chr_fix[fst_peaks$chr== "NC_042541.1"] <- 7
fst_peaks$chr_fix[fst_peaks$chr== "NC_042542.1"] <- 8
fst_peaks$chr_fix[fst_peaks$chr== "NC_042543.1"] <- 9
fst_peaks$chr_fix[fst_peaks$chr== "NC_042544.1"] <- 10
fst_peaks$chr_fix[fst_peaks$chr== "NC_042545.1"] <- 11
fst_peaks$chr_fix[fst_peaks$chr== "NC_042546.1"] <- 12
fst_peaks$chr_fix[fst_peaks$chr== "NC_042547.1"] <- 13
fst_peaks$chr_fix[fst_peaks$chr== "NC_042548.1"] <- 14
fst_peaks$chr_fix[fst_peaks$chr== "NC_042549.1"] <- 15
fst_peaks$chr_fix[fst_peaks$chr== "NC_042550.1"] <- 16
fst_peaks$chr_fix[fst_peaks$chr== "NC_042551.1"] <- 17
fst_peaks$chr_fix[fst_peaks$chr== "NC_042552.1"] <- 18
fst_peaks$chr_fix[fst_peaks$chr== "NC_042553.1"] <- 19
fst_peaks$chr_fix[fst_peaks$chr== "NC_042554.1"] <- 20
fst_peaks$chr_fix[fst_peaks$chr== "NC_042555.1"] <- 21
fst_peaks$chr_fix[fst_peaks$chr== "NC_042556.1"] <- 22
fst_peaks$chr_fix[fst_peaks$chr== "NC_042557.1"] <- 23
fst_peaks$chr_fix[fst_peaks$chr== "NC_042558.1"] <- 24
fst_peaks$chr_fix[fst_peaks$chr== "NC_042559.1"] <- 25
fst_peaks$chr_fix[fst_peaks$chr== "NC_042560.1"] <- 26
fst_peaks$chr_fix[fst_peaks$chr== "NC_042561.1"] <- 27
fst_peaks$chr_fix[fst_peaks$chr== "NC_042562.1"] <- 28
fst_peaks$chr_fix[fst_peaks$chr== "NC_042563.1"] <- 29

fst_sv<-fread("summary_fst_svs.txt", header= TRUE)
fst_sv$chr_fix[fst_sv$chr== "NC_042535.1"] <- 1
fst_sv$chr_fix[fst_sv$chr== "NC_042536.1"] <- 2
fst_sv$chr_fix[fst_sv$chr== "NC_042537.1"] <- 3
fst_sv$chr_fix[fst_sv$chr== "NC_042538.1"] <- 4
fst_sv$chr_fix[fst_sv$chr== "NC_042539.1"] <- 5
fst_sv$chr_fix[fst_sv$chr== "NC_042540.1"] <- 6
fst_sv$chr_fix[fst_sv$chr== "NC_042541.1"] <- 7
fst_sv$chr_fix[fst_sv$chr== "NC_042542.1"] <- 8
fst_sv$chr_fix[fst_sv$chr== "NC_042543.1"] <- 9
fst_sv$chr_fix[fst_sv$chr== "NC_042544.1"] <- 10
fst_sv$chr_fix[fst_sv$chr== "NC_042545.1"] <- 11
fst_sv$chr_fix[fst_sv$chr== "NC_042546.1"] <- 12
fst_sv$chr_fix[fst_sv$chr== "NC_042547.1"] <- 13
fst_sv$chr_fix[fst_sv$chr== "NC_042548.1"] <- 14
fst_sv$chr_fix[fst_sv$chr== "NC_042549.1"] <- 15
fst_sv$chr_fix[fst_sv$chr== "NC_042550.1"] <- 16
fst_sv$chr_fix[fst_sv$chr== "NC_042551.1"] <- 17
fst_sv$chr_fix[fst_sv$chr== "NC_042552.1"] <- 18
fst_sv$chr_fix[fst_sv$chr== "NC_042553.1"] <- 19
fst_sv$chr_fix[fst_sv$chr== "NC_042554.1"] <- 20
fst_sv$chr_fix[fst_sv$chr== "NC_042555.1"] <- 21
fst_sv$chr_fix[fst_sv$chr== "NC_042556.1"] <- 22
fst_sv$chr_fix[fst_sv$chr== "NC_042557.1"] <- 23
fst_sv$chr_fix[fst_sv$chr== "NC_042558.1"] <- 24
fst_sv$chr_fix[fst_sv$chr== "NC_042559.1"] <- 25
fst_sv$chr_fix[fst_sv$chr== "NC_042560.1"] <- 26
fst_sv$chr_fix[fst_sv$chr== "NC_042561.1"] <- 27
fst_sv$chr_fix[fst_sv$chr== "NC_042562.1"] <- 28
fst_sv$chr_fix[fst_sv$chr== "NC_042563.1"] <- 29

centromere<-fread("centromere_onerka.txt", header=TRUE)
###yellow stream "#fecb02", red shore "#e80000 , blue sockeye "#1a759f"
###orange shore-stream ""#fd9109"", green stream-sockeye "#a7c957", purple shore-sockeye #3d0a65"


div=1000000
ggplot() +
  geom_segment(data = size,
               aes(x = as.factor(chr_fix), xend = as.factor(chr_fix), y = 0, yend = size/div),
               lineend = "round", color = "lightgrey", size = 8, alpha=0.3) +
  geom_rect(data=centromere,
            aes(xmin=chr_fix-0.25, xmax=chr_fix+0.25, ymin=start/div, ymax=end/div), fill="lightgrey", alpha=0.8) +
  geom_segment(data = alm_fixed,
                aes(x = as.integer(chr_fix)-0.18, xend = as.integer(chr_fix) +0.18,
                   y = position/div, yend = position/div, colour=stream_nor)) +  scale_color_gradient2(midpoint = 0.5, low = "#e80000", mid = "white",
                                                                                              high = "#1a759f") +
  geom_point(data = subset(fst_peaks, comparison=="stream-shore"),
            aes(x = as.integer(chr_fix)-0.30,
                y = mid/div), color="#fd9109", size=2, alpha=0.5)+
  geom_point(data = subset(fst_peaks, comparison=="stream-sockeye"),
             aes(x = as.integer(chr_fix),
                 y = mid/div), color="#a7c957", size=2, alpha=0.5)+
  geom_point(data = subset(fst_peaks, comparison=="shore-sockeye"),
            aes(x = as.integer(chr_fix)+0.30,
                y = mid/div), color="#3d0a65", size=2, alpha=0.5)+
  geom_point(data = subset(fst_sv, comparison=="stream-shore"),
             aes(x = as.integer(chr_fix)-0.30,
                 y = position/div), color="#fd9109", shape=23,size=1, fill="white")+
  geom_point(data = subset(fst_sv, comparison=="stream-sockeye"),
             aes(x = as.integer(chr_fix),
                 y = position/div), color="#a7c957", shape=23,size=1, fill="white")+
  geom_point(data = subset(fst_sv, comparison=="shore-sockeye"),
             aes(x = as.integer(chr_fix)+0.30,
                 y = position/div), color="#3d0a65", shape=23,size=1, fill="white")+
  theme_bw() +
  scale_y_reverse() + 
  theme( panel.grid.minor = element_blank(),panel.grid.major = element_blank(), legend.position = "bottom",  legend.key.width = unit(0.5, "cm"), legend.key.height = unit(0.2, "cm")) + scale_x_discrete(position = "top") +
  xlab("Chromosome") + ylab("Position") 
