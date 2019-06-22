library(ggplot2)
library(plyr)
library(tidyr)
data = read.table('/Users/rosingle/Documents/theseEcriture/Etat_these/dataAero/datacn_normal_combined.txt',header = TRUE)
#View(data)
colnames(data) = c("voyelle","partie","vitesse","durée",'locuteur')
# View(data)
remapping <- c(an="ɑŋ", ain="an",on='uŋ')
# remapping <- c(an="ɑ̃", ain="ɛ̃",on='ɔ̃')
data$unicodevowel <- remapping[as.character(data$voyelle)]
cdata <- ddply(data, c('locuteur','partie','voyelle'), summarise,
              N=length(durée),
             mean = round(mean(durée),0),
            sd   = round(sd(durée),0)
)
# View(cdata)

cdata$durée = cdata$mean
# View(cdata)
remapping <- c(an="ɑŋ", ain="an",on='uŋ')
# remapping <- c(an="ɑ̃", ain="ɛ̃",on='ɔ̃')
cdata$unicodevowel <- remapping[as.character(cdata$voyelle)]
cdata2 = cdata[c('locuteur','partie','mean','unicodevowel')]
cdata2_sd = cdata[c('locuteur','partie','sd','unicodevowel')]
#cdata2 = cdata[c('partie','mean','unicodevowel')]
#cdata2_sd = cdata[c('partie','sd','unicodevowel')]
#View(cdata2)
cdata_wide <- spread(cdata2, partie, mean)
cdata_wide_sd <- spread(cdata2_sd, partie, sd)
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
write.table(cdata_total,'/Users/rosingle/blog/piezo/Etat_these/data/tablenormal.txt',row.names = FALSE)

data$locuteur <- factor(cdata$locuteur)
data$voyelle <- factor(cdata$voyelle)
data$partie <- factor(cdata$partie)
# View(data)
data$durée <- as.numeric(as.character(cdata$durée))
levels(cdata$locuteur)
levels(cdata$voyelle)
levels(cdata$partie)
# ggplot(data=cdata, aes(x=partie, y=durée, fill=partie))  + geom_bar(stat="identity") + facet_grid(locuteur ~ unicodevowel,, scales="free_y")
ggplot(cdata, aes(x=voyelle, y=durée, fill=partie))  + geom_bar(stat="identity") + facet_grid(. ~ locuteur, scales="free_y")
#,position=position_dodge()


# + facet_grid(. ~ locuteur)

