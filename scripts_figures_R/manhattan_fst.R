library(data.table)
library(ggplot2)
library(tidyverse)
library(gapminder)
library(patchwork)

#50 kb

fst_stream_shore_50<-fread("stream_shore_50kb.fst", header=TRUE)
fst_stream_sockeye_50<-fread("stream_sockeye_50kb.fst", header=TRUE)
fst_shore_sockeye_50<-fread("shore_sockeye_50kb.fst", header=TRUE)

###Replace chr naming
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042535.1"] <- 1
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042536.1"] <- 2
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042537.1"] <- 3
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042538.1"] <- 4
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042539.1"] <- 5
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042540.1"] <- 6
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042541.1"] <- 7
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042542.1"] <- 8
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042543.1"] <- 9
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042544.1"] <- 10
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042545.1"] <- 11
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042546.1"] <- 12
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042547.1"] <- 13
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042548.1"] <- 14
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042549.1"] <- 15
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042550.1"] <- 16
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042551.1"] <- 17
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042552.1"] <- 18
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042553.1"] <- 19
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042554.1"] <- 20
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042555.1"] <- 21
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042556.1"] <- 22
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042557.1"] <- 23
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042558.1"] <- 24
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042559.1"] <- 25
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042560.1"] <- 26
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042561.1"] <- 27
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042562.1"] <- 28
fst_stream_shore_50$chr_fix[fst_stream_shore_50$chr == "NC_042563.1"] <- 29

fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042535.1"] <- 1
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042536.1"] <- 2
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042537.1"] <- 3
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042538.1"] <- 4
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042539.1"] <- 5
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042540.1"] <- 6
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042541.1"] <- 7
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042542.1"] <- 8
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042543.1"] <- 9
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042544.1"] <- 10
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042545.1"] <- 11
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042546.1"] <- 12
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042547.1"] <- 13
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042548.1"] <- 14
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042549.1"] <- 15
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042550.1"] <- 16
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042551.1"] <- 17
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042552.1"] <- 18
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042553.1"] <- 19
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042554.1"] <- 20
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042555.1"] <- 21
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042556.1"] <- 22
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042557.1"] <- 23
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042558.1"] <- 24
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042559.1"] <- 25
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042560.1"] <- 26
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042561.1"] <- 27
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042562.1"] <- 28
fst_stream_sockeye_50$chr_fix[fst_stream_sockeye_50$chr == "NC_042563.1"] <- 29

fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042535.1"] <- 1
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042536.1"] <- 2
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042537.1"] <- 3
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042538.1"] <- 4
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042539.1"] <- 5
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042540.1"] <- 6
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042541.1"] <- 7
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042542.1"] <- 8
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042543.1"] <- 9
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042544.1"] <- 10
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042545.1"] <- 11
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042546.1"] <- 12
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042547.1"] <- 13
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042548.1"] <- 14
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042549.1"] <- 15
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042550.1"] <- 16
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042551.1"] <- 17
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042552.1"] <- 18
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042553.1"] <- 19
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042554.1"] <- 20
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042555.1"] <- 21
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042556.1"] <- 22
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042557.1"] <- 23
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042558.1"] <- 24
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042559.1"] <- 25
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042560.1"] <- 26
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042561.1"] <- 27
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042562.1"] <- 28
fst_shore_sockeye_50$chr_fix[fst_shore_sockeye_50$chr == "NC_042563.1"] <- 29

### PLOTS ###
#manhattan plot stream/shore
st_sh_col<-rep(c("#cfc0bd","#fd9109"), length.out = 30)

fst_st_sh<-ggplot(data = fst_stream_shore_50,
       aes(x = midPos, 
           y = fst,
           fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =st_sh_col) +
  scale_fill_manual(values = st_sh_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "", y="") + theme_classic() + ggtitle("Stream kokanee - shore kokanee") + 
  geom_hline(yintercept=quantile(fst_stream_shore_50$fst,0.999),linetype="dashed", color = "grey") +
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

#manhattan plot stream/sockeye
st_so_col<-rep(c("#cfc0bd","#a7c957"), length.out = 30)

fst_st_so<-ggplot(data = fst_stream_sockeye_50,
       aes(x = midPos, 
           y = fst,
           fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =st_so_col) +
  scale_fill_manual(values = st_so_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "", y="Fst") + theme_classic() + ggtitle("Stream kokanee - sockeye") +
  geom_hline(yintercept=quantile(fst_stream_sockeye_50$fst,0.999),linetype="dashed", color = "grey") +
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

#manhattan plot shore/sockeye
sh_so_col<-rep(c("#cfc0bd","#3d0a65"), length.out = 30)

fst_sh_so<-ggplot(data = fst_shore_sockeye_50,
       aes(x = midPos, 
           y = fst,
           fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =sh_so_col) +
  scale_fill_manual(values = sh_so_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  ylim(-0.05,0.95) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x", switch="x") +
  labs(x = "Chromosome", y="") + theme_classic() + ggtitle("Shore kokanee - sockeye") +
  geom_hline(yintercept=quantile(fst_shore_sockeye_50$fst,0.999),linetype="dashed", color = "grey") +
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

fst_st_sh/fst_st_so/fst_sh_so & theme(plot.margin = margin(1,5,0,5))# saved 9x6
