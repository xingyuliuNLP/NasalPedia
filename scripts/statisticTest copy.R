library(MASS)
datafr = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/dataAero/datafr_lent.txt',header = TRUE)
datafr.oral =  datafr[datafr$partie=='oral',]
datafr1 = datafr[datafr$partie=='oral' & datafr$voyelle == 'ain',]
datafr2 = datafr[datafr$partie=='oral' & datafr$voyelle == 'an',]
datafr3 = datafr[datafr$partie=='oral' & datafr$voyelle == 'on',]
datafr4 = datafr[datafr$partie=='oral' & datafr$groupe == 'good' ,]
datafr5 = datafr[datafr$partie=='oral' & datafr$groupe == 'bad' ,]
# t.test(datafr4$durée,datafr5$durée)
# datafr4.ain = datafr4[datafr$voyelle == "ain"]
# datafr4.an = datafr4[datafr$voyelle == "ain"]
# datafr4.on = datafr4[datafr$voyelle == "ain"]
# datafr5.ain = datafr5[datafr$voyelle == "ain"]
# datafr5.an = datafr5[datafr$voyelle == "ain"]
# datafr5.on = datafr5[datafr$voyelle == "ain"]
with(datafr.oral,tapply(durée,list(groupe,voyelle),mean))
head(datafr)
par(mfrow = c(2, 3))
#par(mfrow=c(1,1))
truehist(datafr1$durée,col = "lightgrey", xlab = "durée", ylab = 'fréquence relative')
truehist(datafr2$durée,col = "lightgrey", xlab = "durée", ylab = 'fréquence relative')
truehist(datafr3$durée,col = "lightgrey", xlab = "durée", ylab = 'fréquence relative')
plot(density(datafr1$durée))
plot(density(datafr2$durée))
plot(density(datafr3$durée))
# plot(density(datafr$durée))
#boxplot(datafr$durée,ylab ="durée de la partie orale", xlab ="fr")
shapiro.test(datafr1$durée)
shapiro.test(datafr2$durée)
shapiro.test(datafr3$durée)
# library(MASS)
# datafr = read.table('/Users/rosingle/blog/piezo/Etat_these/data/datacnfr_normal_combined.txt',header = TRUE)
# 1st distribution
svg("datafr_lent1.svg")
datafr = datafr[datafr$partie=='oral',]
# head(datafr)
par(mfrow = c(1, 2))
truehist(datafr$durée,col = "lightgrey", xlab = "durée", ylab = 'fréquence relative')
# plot(density(datafr$durée))
boxplot(datafr$durée,ylab ="durée de la partie orale", xlab ="fr")

dev.off()
# shapiro.test(datafr$durée)

