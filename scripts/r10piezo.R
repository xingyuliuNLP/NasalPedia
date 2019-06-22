library(ggplot2)
library(plyr)
library(tidyr)
data = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/dataAero/datacn_normal_combined_piezo.txt',header = TRUE)
#View(data)
colnames(data) = c("voyelle","Piezo","vitesse","durée",'locuteur')
# View(data)
# this line to compare chinese
remapping <- c(an="ɑŋ", ain="an",on='uŋ')
# this line to compare french
# remapping <- c(an="ɑ̃", ain="ɛ̃",on='ɔ̃')
data$voyelleUnicode <- remapping[as.character(data$voyelle)]
cdata <- ddply(data, c('locuteur','Piezo','voyelle'), summarise,
# only for no group calculation
# cdata <- ddply(data, c('Piezo','voyelle'), summarise,
               N=length(durée),
               mean = round(mean(durée),0),
               sd   = round(sd(durée),0)
)
# View(cdata)

cdata$durée = cdata$mean
# View(cdata)
remapping <- c(an="ɑŋ", ain="an",on='uŋ')
# remapping <- c(an="ɑ̃", ain="ɛ̃",on='ɔ̃')
cdata$voyelle <- remapping[as.character(cdata$voyelle)]

cdata2 = cdata[c('locuteur','Piezo','mean','unicodevowel')]
cdata2_sd = cdata[c('locuteur','Piezo','sd','unicodevowel')]
#cdata2 = cdata[c('Piezo,'mean','unicodevowel')]
#cdata2_sd = cdata[c('Piezo,'sd','unicodevowel')]
#View(cdata2)
cdata_wide <- spread(cdata2, Piezo, mean)
cdata_wide_sd <- spread(cdata2_sd, Piezo, sd)
cdata_wide
cdata_wide_sd
#View(cdata_wide)
#View(cdata_wide_sd)
# cdata_total= cbind(cdata_wide,cdata_wide_sd[,3:4])
cdata_total= cbind(cdata_wide[,1:4],cdata_wide_sd[,3:4])
head(cdata_total)
cdata_total$total = round(cdata_total[,3]+cdata_total[,4])
# cdata_total$total = round(cdata_total[,3]+cdata_total[,4])

#cdata_total$percentage = (cdata_total[,3]/(cdata_total[,3]+cdata_total[,2]))* 100
cdata_total$percentage = (cdata_total[,4]/(cdata_total[,4]+cdata_total[,3]))* 100

cdata_total$percentage = round(cdata_total$percentage,0)

#View(cdata_total)
# write.table(cdata_total,'/Users/rosingle/blog/piezo/Etat_these/data/tablenormal.txt',row.names = FALSE)

data$locuteur <- factor(cdata$locuteur)
data$voyelle <- factor(cdata$voyelle)
data$Piezo <- factor(cdata$Piezo)
# View(data)
data$durée <- as.numeric(as.character(cdata$durée))
levels(cdata$locuteur)
levels(cdata$voyelle)
levels(cdata$Piezo)
# ggplot(data=cdata, aes(x=Piezo, y=durée, fill=Piezo))  + geom_bar(stat="identity") + facet_grid(locuteur ~ unicodevowel,, scales="free_y")

# View(cdata)
ggplot(cdata, aes(x=voyelle, y=durée, fill=Piezo))  + 
    geom_bar(stat="identity",) + 
    # for no group comparaison, remove facet line
    facet_grid(. ~ locuteur, scales="free_y") + theme(legend.position="right") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse normale") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse lente") +
    ggtitle("Piezo : syllabe /pVoN/ : apprenantes en vitesse lente") +
    theme(plot.title = element_text(hjust = 0.5))
ggsave("hehe.png")
#,position=position_dodge()


# + facet_grid(. ~ locuteur)

