library(data.table)
library(tidyverse)
library(patchwork)
spaw4<-fread("association_spawning_oka_asso4.lrt0", header=TRUE)
migr4<-fread("association_migration_oka_asso4.lrt0", header=TRUE)
sex4<-fread("association_sex_oka_asso4.lrt0", header=TRUE)

#spawning behaviour
spaw4_filt<-spaw4 %>%
  filter(!beta == "NaN") 
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042535.1"] <- 1
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042536.1"] <- 2
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042537.1"] <- 3
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042538.1"] <- 4
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042539.1"] <- 5
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042540.1"] <- 6
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042541.1"] <- 7
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042542.1"] <- 8
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042543.1"] <- 9
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042544.1"] <- 10
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042545.1"] <- 11
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042546.1"] <- 12
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042547.1"] <- 13
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042548.1"] <- 14
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042549.1"] <- 15
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042550.1"] <- 16
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042551.1"] <- 17
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042552.1"] <- 18
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042553.1"] <- 19
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042554.1"] <- 20
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042555.1"] <- 21
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042556.1"] <- 22
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042557.1"] <- 23
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042558.1"] <- 24
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042559.1"] <- 25
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042560.1"] <- 26
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042561.1"] <- 27
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042562.1"] <- 28
spaw4_filt$Chromosome_fix[spaw4_filt$Chromosome == "NC_042563.1"] <- 29

spaw4_filt$pval<-1-pchisq(spaw4_filt$LRT,1)
spaw4_filt$pval_log<--log10(spaw4_filt$pval)

#migratory behaviour
migr4_filt<-migr4 %>%
  filter(!beta == "NaN") 
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042535.1"] <- 1
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042536.1"] <- 2
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042537.1"] <- 3
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042538.1"] <- 4
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042539.1"] <- 5
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042540.1"] <- 6
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042541.1"] <- 7
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042542.1"] <- 8
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042543.1"] <- 9
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042544.1"] <- 10
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042545.1"] <- 11
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042546.1"] <- 12
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042547.1"] <- 13
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042548.1"] <- 14
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042549.1"] <- 15
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042550.1"] <- 16
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042551.1"] <- 17
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042552.1"] <- 18
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042553.1"] <- 19
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042554.1"] <- 20
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042555.1"] <- 21
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042556.1"] <- 22
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042557.1"] <- 23
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042558.1"] <- 24
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042559.1"] <- 25
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042560.1"] <- 26
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042561.1"] <- 27
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042562.1"] <- 28
migr4_filt$Chromosome_fix[migr4_filt$Chromosome == "NC_042563.1"] <- 29

migr4_filt$pval<-1-pchisq(migr4_filt$LRT,1)
migr4_filt$pval_log<--log10(migr4_filt$pval)


sex4_filt<-sex4 %>%
  filter(!beta == "NaN") 
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042535.1"] <- 1
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042536.1"] <- 2
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042537.1"] <- 3
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042538.1"] <- 4
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042539.1"] <- 5
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042540.1"] <- 6
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042541.1"] <- 7
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042542.1"] <- 8
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042543.1"] <- 9
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042544.1"] <- 10
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042545.1"] <- 11
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042546.1"] <- 12
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042547.1"] <- 13
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042548.1"] <- 14
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042549.1"] <- 15
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042550.1"] <- 16
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042551.1"] <- 17
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042552.1"] <- 18
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042553.1"] <- 19
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042554.1"] <- 20
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042555.1"] <- 21
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042556.1"] <- 22
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042557.1"] <- 23
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042558.1"] <- 24
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042559.1"] <- 25
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042560.1"] <- 26
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042561.1"] <- 27
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042562.1"] <- 28
sex4_filt$Chromosome_fix[sex4_filt$Chromosome == "NC_042563.1"] <- 29

sex4_filt$pval<-1-pchisq(sex4_filt$LRT,1)
sex4_filt$pval_log<--log10(sex4_filt$pval)

###Bonferroni correction
bonf_spaw4=-log10(0.05/length(spaw4_filt$N)) #7.482468
bonf_migr4=-log10(0.05/length(migr4_filt$N)) #7.482475
bonf_sex4=-log10(0.05/length(sex4_filt$N)) #7.482473

### Plots for paper
#############################################################################
spawning_col<-rep(c("#cfc0bd","#8aa1b1"), length.out = 30)
migration_col<-rep(c("#cfc0bd","#9ac2c9"), length.out = 30)
sex_col<-rep(c("#cfc0bd","#b9d8c2"), length.out = 30)

spaw4_plot<-spaw4_filt%>%
  ggplot(aes(x = Position, 
                       y = pval_log,
                       col = as.factor(Chromosome_fix), fill = as.factor(Chromosome_fix),)) +
  geom_point(shape=21,size=0.5, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =spawning_col) +
  scale_fill_manual(values = spawning_col) +
  # facet by CHR
  facet_grid(cols = vars(Chromosome_fix),
             space = "free_x",
             scales = "free_x",switch = "x") +
  labs(x = "") + theme_classic() + ggtitle("Spawning behaviour") + ylab("") +
  geom_hline(yintercept=bonf_spaw4,linetype="dashed", color = "grey") +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid = element_blank(),
    panel.spacing = unit(0.1, "cm"), # adjust spacing between facets
    strip.background = element_blank(),
    strip.text.x = element_text(size=8),
    legend.position = "none",
    #axis.line.x = element_blank(),
    #axis.line.x.top = element_line(color="black")
    plot.title = element_text(hjust = 0.5),
    strip.placement = "outside"
)

migr4_plot<-migr4_filt%>%
  ggplot(aes(x = Position, 
             y = pval_log,
             col = as.factor(Chromosome_fix), fill = as.factor(Chromosome_fix),)) +
  geom_point(shape=21,size=0.5, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =migration_col) +
  scale_fill_manual(values = migration_col) +
  # facet by CHR
  facet_grid(cols = vars(Chromosome_fix),
             space = "free_x",
             scales = "free_x",switch = "x") +
  labs(x = "") + theme_classic() + ggtitle("Migratory behaviour") + ylab("-log10(p-value)") +
geom_hline(yintercept=bonf_migr4,linetype="dashed", color = "grey") +
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


sex4_plot<-sex4_filt%>%
  ggplot(aes(x = Position, 
             y = pval_log,
             col = as.factor(Chromosome_fix), fill = as.factor(Chromosome_fix),)) +
  geom_point(shape=21,size=0.5, stroke=0.2, alpha=0.4) +
  scale_colour_manual(values =sex_col) +
  scale_fill_manual(values = sex_col) +
  # facet by CHR
  facet_grid(cols = vars(Chromosome_fix),
             space = "free_x",
             scales = "free_x",switch = "x") +
  labs(x = "") + theme_classic() + ggtitle("Sex determination") + ylab("") + xlab("Chromosome") +
geom_hline(yintercept=bonf_sex4,linetype="dashed", color = "grey") +
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

spaw4_plot/migr4_plot/sex4_plot & theme(plot.margin = margin(1,5,0,5))
