dxy_stream_shore_50<-fread("dxy_shore_stream_50kwin_corrected.txt", header=TRUE)
dxy_stream_sockeye_50<-fread("dxy_stream_sockeye_50kwin_corrected.txt", header=TRUE)
dxy_shore_sockeye_50<-fread("dxy_shore_sockeye_50kwin_corrected.txt", header=TRUE)

###Replace chr naming
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042535.1"] <- 1
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042536.1"] <- 2
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042537.1"] <- 3
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042538.1"] <- 4
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042539.1"] <- 5
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042540.1"] <- 6
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042541.1"] <- 7
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042542.1"] <- 8
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042543.1"] <- 9
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042544.1"] <- 10
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042545.1"] <- 11
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042546.1"] <- 12
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042547.1"] <- 13
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042548.1"] <- 14
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042549.1"] <- 15
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042550.1"] <- 16
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042551.1"] <- 17
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042552.1"] <- 18
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042553.1"] <- 19
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042554.1"] <- 20
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042555.1"] <- 21
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042556.1"] <- 22
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042557.1"] <- 23
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042558.1"] <- 24
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042559.1"] <- 25
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042560.1"] <- 26
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042561.1"] <- 27
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042562.1"] <- 28
dxy_stream_shore_50$chr_fix[dxy_stream_shore_50$chr == "NC_042563.1"] <- 29

st_sh_col<-rep(c("#cfc0bd","#fd9109"), length.out = 30)
#manhattan plot stream/shore
dxy_st_sh<-ggplot(data = dxy_stream_shore_50,
                  aes(x = start, 
                      y = dxy,
                      fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =st_sh_col) +
  scale_fill_manual(values = st_sh_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.8) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "") + theme_classic() + ggtitle("Stream kokanee - shore kokanee") +
  geom_hline(yintercept=quantile(dxy_stream_shore_50$dxy,0.999),linetype="dashed", color = "grey") +
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
st_so_col<-rep(c("#cfc0bd","#a7c957"), length.out = 30)
#manhattan plot stream/sockeye
dxy_st_so<-ggplot(data = dxy_stream_sockeye_50,
                  aes(x = start, 
                      y = dxy,
                      fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =st_so_col) +
  scale_fill_manual(values = st_so_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.8) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "") + theme_classic() + ggtitle("Stream kokanee - sockeye") +
  geom_hline(yintercept=quantile(dxy_stream_sockeye_50$dxy,0.999),linetype="dashed", color = "grey") +
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
sh_so_col<-rep(c("#cfc0bd","#3d0a65"), length.out = 30)
#manhattan plot shore/sockeye
dxy_sh_so<-ggplot(data = dxy_shore_sockeye_50,
                  aes(x = start, 
                      y = dxy,
                      fill = as.factor(chr_fix), col=as.factor(chr_fix))) +
  geom_point(shape=21,size=1, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =sh_so_col) +
  scale_fill_manual(values = sh_so_col) +
  # remove space between plot area and x axis
  #scale_y_continuous(expand = c(0, 0)) +
  #ylim(-0.05,0.8) +
  # facet by CHR
  facet_grid(cols = vars(chr_fix),
             space = "free_x",
             scales = "free_x",switch="x") +
  labs(x = "Chromosome") + theme_classic() + ggtitle("Shore kokanee - sockeye") +
  geom_hline(yintercept=quantile(dxy_shore_sockeye_50$dxy,0.999),linetype="dashed", color = "grey") +
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
dxy_st_sh/dxy_st_so/dxy_sh_so # saved 9x6


dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042535.1"] <- 1
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042536.1"] <- 2
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042537.1"] <- 3
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042538.1"] <- 4
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042539.1"] <- 5
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042540.1"] <- 6
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042541.1"] <- 7
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042542.1"] <- 8
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042543.1"] <- 9
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042544.1"] <- 10
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042545.1"] <- 11
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042546.1"] <- 12
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042547.1"] <- 13
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042548.1"] <- 14
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042549.1"] <- 15
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042550.1"] <- 16
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042551.1"] <- 17
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042552.1"] <- 18
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042553.1"] <- 19
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042554.1"] <- 20
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042555.1"] <- 21
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042556.1"] <- 22
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042557.1"] <- 23
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042558.1"] <- 24
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042559.1"] <- 25
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042560.1"] <- 26
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042561.1"] <- 27
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042562.1"] <- 28
dxy_stream_sockeye_50$chr_fix[dxy_stream_sockeye_50$chr == "NC_042563.1"] <- 29

dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042535.1"] <- 1
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042536.1"] <- 2
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042537.1"] <- 3
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042538.1"] <- 4
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042539.1"] <- 5
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042540.1"] <- 6
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042541.1"] <- 7
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042542.1"] <- 8
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042543.1"] <- 9
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042544.1"] <- 10
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042545.1"] <- 11
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042546.1"] <- 12
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042547.1"] <- 13
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042548.1"] <- 14
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042549.1"] <- 15
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042550.1"] <- 16
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042551.1"] <- 17
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042552.1"] <- 18
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042553.1"] <- 19
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042554.1"] <- 20
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042555.1"] <- 21
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042556.1"] <- 22
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042557.1"] <- 23
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042558.1"] <- 24
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042559.1"] <- 25
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042560.1"] <- 26
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042561.1"] <- 27
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042562.1"] <- 28
dxy_shore_sockeye_50$chr_fix[dxy_shore_sockeye_50$chr == "NC_042563.1"] <- 29
