chineseModel = read.table("/Users/rosingle/Documents/theseAnalysis/20juin/NOTUSed/NOTChinese1Simplified.txt",header = T)

chineseModel
chineseModel = model %>%
    select(consonant,speed,vowel,oralPerc,totalDuration) %>%
    filter(!consonant %in% c("m","n"))

remapping <- c(eu ="ø", oe = "œ", ao = "ɔ",i = "i", a = "a", e = "e", ai = "ɛ", u = "u", y = "y", o = "o",ang = "ang",on = "ɔ̃",an="an",E = "ɛ","O" = "ɔ",ong="ong",ain="ɛ̃"
               ,en = "ɑ̃")

chineseModel$voyelle <- remapping[as.character(chineseModel$vowel)]
chineseModel$oralDuration <- round(chineseModel$oralPerc * chineseModel$totalDuration / 100)
chineseModel$nasalDuration <- chineseModel$totalDuration-chineseModel$oralDuration
chineseModel$nasalPerc <- 100 - chineseModel$oralPerc



meanChineseModel <- chineseModel %>% 
    group_by(consonant,speed,voyelle) %>%
    dplyr::summarize(
        meanOralPerc = round(mean(oralPerc)),
        meanTotalDuration = round(mean(totalDuration))
    ) 


meanChineseGraphModel <- chineseModel %>% 
    group_by(consonant,speed,voyelle) %>%
    dplyr::summarize(
        oral = round(mean(oralDuration)),
        nasal = round(mean(nasalDuration)),
        oralPerc = round(mean(oralPerc)),
        nasalPerc = round(mean(nasalPerc)),
    ) 


####################
# change meanChineseGraphModel


## here is for the absolute duration
library(tidyr)

meanChineseGraphModel$consonant <- factor(meanChineseGraphModel$consonant, levels = c("p", "t", "s","l"))

meanChineseGraphModelLong <- gather(meanChineseGraphModel,key = partie, durée,oral:nasal)
## don't run two at the same time

## here is for the percentage
meanChineseGraphModelPercent <- gather(meanChineseGraphModel,key = perc, Perc,oralPerc:nasalPerc)
# bargraph

# with(meanChineseModel, tapply(meanTotalDuration, list(speed,consonant,voyelle), mean))

meanChineseGraphModelLong %>%
    # filter(speed == "s") %>%
ggplot(aes(x=speed, y=durée, fill=partie))  + geom_bar(stat="identity") + 
    # ,colour="black", add after identity
    facet_grid(  voyelle~  consonant, scales="free_y") + 
    ylab("Duréé") + xlab("Vitesse") + theme(legend.position="right") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse normale") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse lente") +
    # ggtitle("Po et Pn en /CVoN/ en chinois\n à travers les consonnes  - profile_A") +
    coord_flip() +
    # ggtitle("Po et Pn en /CVoN/ en chinois\n à travers les consonnes  - profile_A") +
    ggtitle("Po et Pn dans /CVoN/ en cn\n 3 vitesses + 4 consonnes") +
    theme(text = element_text(size=12),plot.title = element_text(size = 15, hjust = 0.5))

ggsave("cnMicroNasalAbsolute.png") 

meanChineseGraphModelPercent %>%

ggplot(aes(x=speed, y=Perc, fill=perc))  + geom_bar(stat="identity") + 
    # ,colour="black", add after identity
    facet_grid( voyelle ~ consonant) + 
    ylab("Duréé") + xlab("Vitesse") + theme(legend.position="right") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse normale") +
    # ggtitle("DAB et DAN d'une apprenante et d'une native à vitesse lente") +
    # ggtitle("Po et Pn en /CVoN/ en chinois\n à travers les consonnes  - profile_A") +
    coord_flip() +
    # ggtitle("Po et Pn en /CVoN/ en chinois\n à travers les consonnes  - profile_A") +
    ggtitle("Po et Pn dans /CVoN/ en pourcentage en cn\n 3 vitesses + 4 consonnes") +
    theme(text = element_text(size=12),plot.title = element_text(size = 15, hjust = 0.5))

ggsave("cnMicroNasalPercent.png") 

