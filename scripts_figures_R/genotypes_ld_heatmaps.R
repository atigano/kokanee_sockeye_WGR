### Genotype plots
library(GenotypePlot)
setwd("~/Dropbox/postdoc UBC/analyses_kokanee")
popmap<-read.table("popmap_okanagan.txt", header = TRUE)

chr7_aod <- genotype_plot(vcf    = "kokanee_batch1_okanagan_filtered.vcf.gz",   
                          chr    = "NC_042541.1",                                       # chr or scaffold ID
                          start  = 13160000,                                # start of region
                          end    = 13370000,                                # end = end of region
                          popmap = popmap,                              # population membership
                          cluster        = FALSE,                           # whether to organise haplotypes by PCA clustering
                          snp_label_size = 20000,                          # breaks for position labels, eg. plot a position every 100,000 bp
                          colour_scheme=c("#faf3dd","#a5be00", "#513b56"),    # character vector of colour values
                          invariant_filter = TRUE,
                          polarise_genotypes="sockeye")  
chr12_aod <- genotype_plot(vcf    = "kokanee_batch1_okanagan_filtered.vcf.gz",   
                           chr    = "NC_042546.1",                                       # chr or scaffold ID
                           start  = 41110000,                                # start of region
                           end    = 41410000,                                # end = end of region
                           popmap = popmap,                              # population membership
                           cluster        = FALSE,                           # whether to organise haplotypes by PCA clustering
                           snp_label_size = 20000,                          # breaks for position labels, eg. plot a position every 100,000 bp
                           colour_scheme=c("#faf3dd","#a5be00", "#513b56"),     # character vector of colour values
                           invariant_filter = TRUE,
                           polarise_genotypes="sockeye")  

chr20_aod <- genotype_plot(vcf    = "kokanee_batch1_okanagan_filtered.vcf.gz",   
                           chr    = "NC_042554.1",                                       # chr or scaffold ID
                           start  = 45350000,                                # start of region
                           end    = 45600000,                                # end = end of region
                           popmap = popmap,                              # population membership
                           cluster        = FALSE,                           # whether to organise haplotypes by PCA clustering
                           snp_label_size = 20000,                          # breaks for position labels, eg. plot a position every 100,000 bp
                           colour_scheme=c("#faf3dd","#a5be00", "#513b56"),   # character vector of colour values
                           invariant_filter = TRUE,
                           polarise_genotypes="sockeye")  
plot7<-combine_genotype_plot(chr7_aod)
plot12<-combine_genotype_plot(chr12_aod) #8x3.2
plot20<-combine_genotype_plot(chr20_aod)
plot7 / plot12 / plot20


### LD heatmaps
library(ggplot2)
library(patchwork)

chr12_ld_shore<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr12_aod_shore.ld", header=T)
chr12_ld_stream<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr12_aod_stream.ld", header=T)
chr12_ld_sockeye<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr12_aod_sockeye.ld", header=T)

chr20_ld_shore<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr20_aod_shore.ld", header=T)
chr20_ld_stream<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr20_aod_stream.ld", header=T)
chr20_ld_sockeye<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr20_aod_sockeye.ld", header=T)

chr7_ld_shore<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr7_aod_shore.ld", header=T)
chr7_ld_stream<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr7_aod_stream.ld", header=T)
chr7_ld_sockeye<-read.table("kokanee_batch1_okanagan_filtered_sorted_chr7_aod_sockeye.ld", header=T)
div=1000000

chr12_ld_angsd_shore_stream_plot<-ggplot(chr12_ld_shore,aes(x=BP_A/div,y=BP_B/div, col=R2)) + theme_classic() + geom_point(size=0.1, shape=15) + 
  geom_point(data=chr12_ld_stream,aes(x=BP_B/div,y=BP_A/div, col=R2), size=0.1, shape=15) +
  scale_colour_gradientn(colours=c("#fff8d6", "#dc2f02"), limits=c(0,1),  name="R2") + coord_fixed() +
  xlab("position - stream") +ylab("position - shore") + ggtitle("AOD - chr12")+ theme(legend.position="none")+
  geom_vline(xintercept = c(41162738/div,41366047/div), linetype="dashed") + 
  geom_hline(yintercept= c(41162738/div,41366047/div), linetype="dashed") 

chr20_ld_angsd_shore_stream_plot<-ggplot(chr20_ld_shore,aes(x=BP_A/div,y=BP_B/div, col=R2)) + theme_classic() + geom_point(size=0.1, shape=15) + 
  geom_point(data=chr20_ld_stream,aes(x=BP_B/div,y=BP_A/div, col=R2), size=0.1, shape=15) +
  scale_colour_gradientn(colours=c("#fff8d6", "#dc2f02"), limits=c(0,1),  name="R2") + coord_fixed() + 
  xlab("position - stream") +ylab("position - shore")+ ggtitle("AOD - chr20") + theme(legend.key.width = unit(0.3, "cm"), legend.key.height = unit(0.4, "cm")) +
  geom_vline(xintercept = c(45396220/div,45557636/div), linetype="dashed") + 
  geom_hline(yintercept= c(45396220/div,45557636/div), linetype="dashed")

chr7_ld_angsd_shore_stream_plot<-ggplot(chr7_ld_shore,aes(x=BP_A/div,y=BP_B/div, col=R2)) + theme_classic() + geom_point(size=0.1, shape=15) + 
  geom_point(data=chr7_ld_stream,aes(x=BP_B/div,y=BP_A/div, col=R2), size=0.1, shape=15) +
  scale_colour_gradientn(colours=c("#fff8d6", "#dc2f02"), limits=c(0,1),  name="R2") + coord_fixed() + 
  xlab("position - stream") +ylab("position - shore") + ggtitle("AOD - chr7") + theme(legend.position="none") +
  geom_vline(xintercept = c(13212243/div,13319291/div), linetype="dashed") + 
  geom_hline(yintercept= c(13212243/div,13319291/div), linetype="dashed")

chr7_ld_angsd_shore_stream_plot / chr12_ld_angsd_shore_stream_plot / chr20_ld_angsd_shore_stream_plot
