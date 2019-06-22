library(ggplot2)
data = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/dataEva/evaSpeed1.txt',header = T)
data = data[1:12,]

colnames(data) = c("locuteur","voyelle","dab","durée")
remapping <- c(ang="ɑ̃", ain="ɛ̃",on='ɔ̃')
data$unicodevowel <- remapping[as.character(data$voyelle)]
#View(data)
# data$locuteur <- factor(data$locuteur)
# data$voyelle <- factor(data$voyelle)
# data$dab <- factor(data$dab)
# View(data)
# data$durée <- as.numeric(as.character(data$durée))
ggplot(data=data, aes(x=unicodevowel, y=durée, fill=dab))  + geom_bar(stat="identity",colour="black") + 
    facet_grid( ~ locuteur, scales="free_y") + ylab("Duréé") + xlab("Voyelle") + theme(legend.position="bottom")

# +
    # theme(plot.title = element_text(hjust = 0.5))
#,position=position_dodge()


# + facet_grid(. ~ locuteur)

