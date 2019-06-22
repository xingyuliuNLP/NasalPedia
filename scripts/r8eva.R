library(ggplot2)
# data = read.table('',header = T)
# data = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/dataEva/evaSpeed2.txt',header = T)
data = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/dataEva/evaPvn2speed.txt',header = T)
data = data[1:12,]
colnames(data) = c("locuteur","voyelle","DA","durée")
remapping <- c(ang="ɑ̃", ain="ɛ̃",on='ɔ̃')
data$unicodevowel <- remapping[as.character(data$voyelle)]
# data$dab<- factor(data$dab, levels = c("oral", "nasal"))
#View(data)
# data$locuteur <- factor(data$locuteur)
# data$voyelle <- factor(data$voyelle)
# data$dab <- factor(data$dab)
# View(data)
# data$durée <- as.numeric(as.character(data$durée))
library(plyr)

ggplot(data=data, aes(x=unicodevowel, y=durée, fill=DA))  + geom_bar(stat="identity",colour="black") + 
    facet_grid( ~ locuteur, scales="free_y") + 
    ylab("Duréé") + xlab("Voyelle") + theme(legend.position="right") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse normale") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse lente") +
    ggtitle("DAB et DAN en /pVoN/ en chinois à 2 vitesses") +
    theme(plot.title = element_text(hjust = 0.5))
ggsave("evaPvN2Speed.png")
# ggsave("evaspeed1.png")
# ggsave("evaspeed2.png")
# +
    # theme(plot.title = element_text(hjust = 0.5))
#,position=position_dodge()


# + facet_grid(. ~ locuteur)

