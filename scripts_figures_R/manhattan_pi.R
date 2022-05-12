library(data.table)
library(ggplot2)
library(tidyverse)
library(gapminder)
library(patchwork)

theta_stream<-fread("angsd_kok_batch1_okanagan_folded_stream_varonly_50kb.pestPG", header=TRUE)
theta_shore<-fread("angsd_kok_batch1_okanagan_folded_shore_varonly_50kb.pestPG", header=TRUE)
theta_sockeye<-fread("angsd_kok_batch1_okanagan_folded_sockeye_varonly_50kb.pestPG", header=TRUE)

#rename chromosomes
theta_stream$chr_fix[theta_stream$Chr == "NC_042535.1"] <- 1
theta_stream$chr_fix[theta_stream$Chr == "NC_042536.1"] <- 2
theta_stream$chr_fix[theta_stream$Chr == "NC_042537.1"] <- 3
theta_stream$chr_fix[theta_stream$Chr == "NC_042538.1"] <- 4
theta_stream$chr_fix[theta_stream$Chr == "NC_042539.1"] <- 5
theta_stream$chr_fix[theta_stream$Chr == "NC_042540.1"] <- 6
theta_stream$chr_fix[theta_stream$Chr == "NC_042541.1"] <- 7
theta_stream$chr_fix[theta_stream$Chr == "NC_042542.1"] <- 8
theta_stream$chr_fix[theta_stream$Chr == "NC_042543.1"] <- 9
theta_stream$chr_fix[theta_stream$Chr == "NC_042544.1"] <- 10
theta_stream$chr_fix[theta_stream$Chr == "NC_042545.1"] <- 11
theta_stream$chr_fix[theta_stream$Chr == "NC_042546.1"] <- 12
theta_stream$chr_fix[theta_stream$Chr == "NC_042547.1"] <- 13
theta_stream$chr_fix[theta_stream$Chr == "NC_042548.1"] <- 14
theta_stream$chr_fix[theta_stream$Chr == "NC_042549.1"] <- 15
theta_stream$chr_fix[theta_stream$Chr == "NC_042550.1"] <- 16
theta_stream$chr_fix[theta_stream$Chr == "NC_042551.1"] <- 17
theta_stream$chr_fix[theta_stream$Chr == "NC_042552.1"] <- 18
theta_stream$chr_fix[theta_stream$Chr == "NC_042553.1"] <- 19
theta_stream$chr_fix[theta_stream$Chr == "NC_042554.1"] <- 20
theta_stream$chr_fix[theta_stream$Chr == "NC_042555.1"] <- 21
theta_stream$chr_fix[theta_stream$Chr == "NC_042556.1"] <- 22
theta_stream$chr_fix[theta_stream$Chr == "NC_042557.1"] <- 23
theta_stream$chr_fix[theta_stream$Chr == "NC_042558.1"] <- 24
theta_stream$chr_fix[theta_stream$Chr == "NC_042559.1"] <- 25
theta_stream$chr_fix[theta_stream$Chr == "NC_042560.1"] <- 26
theta_stream$chr_fix[theta_stream$Chr == "NC_042561.1"] <- 27
theta_stream$chr_fix[theta_stream$Chr == "NC_042562.1"] <- 28
theta_stream$chr_fix[theta_stream$Chr == "NC_042563.1"] <- 29

theta_stream$chr_fix[theta_stream$Chr == "NC_042535.1"] <- 1
theta_stream$chr_fix[theta_stream$Chr == "NC_042536.1"] <- 2
theta_stream$chr_fix[theta_stream$Chr == "NC_042537.1"] <- 3
theta_stream$chr_fix[theta_stream$Chr == "NC_042538.1"] <- 4
theta_stream$chr_fix[theta_stream$Chr == "NC_042539.1"] <- 5
theta_stream$chr_fix[theta_stream$Chr == "NC_042540.1"] <- 6
theta_stream$chr_fix[theta_stream$Chr == "NC_042541.1"] <- 7
theta_stream$chr_fix[theta_stream$Chr == "NC_042542.1"] <- 8
theta_stream$chr_fix[theta_stream$Chr == "NC_042543.1"] <- 9
theta_stream$chr_fix[theta_stream$Chr == "NC_042544.1"] <- 10
theta_stream$chr_fix[theta_stream$Chr == "NC_042545.1"] <- 11
theta_stream$chr_fix[theta_stream$Chr == "NC_042546.1"] <- 12
theta_stream$chr_fix[theta_stream$Chr == "NC_042547.1"] <- 13
theta_stream$chr_fix[theta_stream$Chr == "NC_042548.1"] <- 14
theta_stream$chr_fix[theta_stream$Chr == "NC_042549.1"] <- 15
theta_stream$chr_fix[theta_stream$Chr == "NC_042550.1"] <- 16
theta_stream$chr_fix[theta_stream$Chr == "NC_042551.1"] <- 17
theta_stream$chr_fix[theta_stream$Chr == "NC_042552.1"] <- 18
theta_stream$chr_fix[theta_stream$Chr == "NC_042553.1"] <- 19
theta_stream$chr_fix[theta_stream$Chr == "NC_042554.1"] <- 20
theta_stream$chr_fix[theta_stream$Chr == "NC_042555.1"] <- 21
theta_stream$chr_fix[theta_stream$Chr == "NC_042556.1"] <- 22
theta_stream$chr_fix[theta_stream$Chr == "NC_042557.1"] <- 23
theta_stream$chr_fix[theta_stream$Chr == "NC_042558.1"] <- 24
theta_stream$chr_fix[theta_stream$Chr == "NC_042559.1"] <- 25
theta_stream$chr_fix[theta_stream$Chr == "NC_042560.1"] <- 26
theta_stream$chr_fix[theta_stream$Chr == "NC_042561.1"] <- 27
theta_stream$chr_fix[theta_stream$Chr == "NC_042562.1"] <- 28
theta_stream$chr_fix[theta_stream$Chr == "NC_042563.1"] <- 29

theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042535.1"] <- 1
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042536.1"] <- 2
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042537.1"] <- 3
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042538.1"] <- 4
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042539.1"] <- 5
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042540.1"] <- 6
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042541.1"] <- 7
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042542.1"] <- 8
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042543.1"] <- 9
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042544.1"] <- 10
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042545.1"] <- 11
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042546.1"] <- 12
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042547.1"] <- 13
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042548.1"] <- 14
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042549.1"] <- 15
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042550.1"] <- 16
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042551.1"] <- 17
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042552.1"] <- 18
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042553.1"] <- 19
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042554.1"] <- 20
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042555.1"] <- 21
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042556.1"] <- 22
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042557.1"] <- 23
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042558.1"] <- 24
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042559.1"] <- 25
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042560.1"] <- 26
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042561.1"] <- 27
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042562.1"] <- 28
theta_sockeye$chr_fix[theta_sockeye$Chr == "NC_042563.1"] <- 29

###merge data together
pi_shore<-theta_shore$tP/50000
pi_stream<-theta_stream$tP/50000
pi_sockeye<-theta_sockeye$tP/50000
taj_shore<-theta_shore$Tajima
taj_stream<-theta_stream$Tajima
taj_sockeye<-theta_sockeye$Tajima
chr<-theta_stream$chr_fix
pos=theta_stream$WinCenter
theta_oka<-cbind(chr,pos, pi_shore, pi_stream,pi_sockeye, taj_shore,taj_stream, taj_sockeye)
theta_oka<-as.data.table(theta_oka)

### PLOTS ###
#manhattan plot π
stream_col<-rep(c("#cfc0bd","#fecb02"), length.out = 30)
shore_col<-rep(c("#cfc0bd","#e80000"), length.out = 30)
sockeye_col<-rep(c("#cfc0bd","#1a759f"), length.out = 30)

pi_stream<-ggplot(data = theta_oka,
                  aes(x = pos, 
                      y = pi_stream,
                      fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =stream_col) +
  scale_fill_manual(values = stream_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "", y="") + theme_classic() + ggtitle("Stream kokanee") + 
  #geom_hline(yintercept=quantile(fst_stream_shore_50$fst,0.999),linetype="dashed", color = "grey") +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid = element_blank(),
    panel.spacing = unit(0.1, "cm"), # adjust spacing between facets
    strip.background = element_blank(),
    strip.text.x = element_text(size=8),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5),
    strip.placement = "outside"
  )

pi_shore<-ggplot(data = theta_oka,
                  aes(x = pos, 
                      y = pi_shore,
                      fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =shore_col) +
  scale_fill_manual(values = shore_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "", y="") + theme_classic() + ggtitle("Shore kokanee") + 
  #geom_hline(yintercept=quantile(fst_stream_shore_50$fst,0.999),linetype="dashed", color = "grey") +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid = element_blank(),
    panel.spacing = unit(0.1, "cm"), # adjust spacing between facets
    strip.background = element_blank(),
    strip.text.x = element_text(size=8),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5),
    strip.placement = "outside"
  )

pi_sockeye<-ggplot(data = theta_oka,
                 aes(x = pos, 
                     y = pi_sockeye,
                     fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =sockeye_col) +
  scale_fill_manual(values = sockeye_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "", y="") + theme_classic() + ggtitle("Sockeye") + 
  #geom_hline(yintercept=quantile(fst_stream_shore_50$fst,0.999),linetype="dashed", color = "grey") +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid = element_blank(),
    panel.spacing = unit(0.1, "cm"), # adjust spacing between facets
    strip.background = element_blank(),
    strip.text.x = element_text(size=8),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5),
    strip.placement = "outside"
  )

pi_stream/pi_shore/pi_sockeye & theme(plot.margin = margin(1,5,0,5))# saved 9x6
