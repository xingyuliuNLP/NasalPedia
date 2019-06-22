library(phonR)
# data(indoVowels)  # provides dataframe 'indo'
totalfemme = read.csv('/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/totalFemmeTriangle.csv')
# with(totalhomme, plotVowels(f2, f3))
# with(totalhomme, plotVowels(f1, f2, vowel = vowel, group = gender))
remapping <- c(eu ="ø", oe = "œ", ao = "ɔ",i = "i", a = "a", e = "e", ai = "ɛ", u = "u", y = "y", o = "o")
totalfemme$unicodevowel <- remapping[as.character(totalfemme$vowel)]
# totalhomme$unicodevowel[1:10]=c('e','ø','u','y','ɛ','i','o','œ','ɔ','a')
svg("ChineseFrenchFormants5Women.svg")
with(totalfemme, plotVowels(f1, f2, vowel, group = gender, plot.tokens = FALSE, plot.means = TRUE, pch.means = unicodevowel, cex.means = 2.2, var.col.by = gender, var.sty.by = gender, ellipse.fill = FALSE, legend.kwd = "bottomleft", poly.line = TRUE, poly.order = c("i", "e","ai","a","ao","o", "u", "y"), pretty = TRUE))
title(main = "Triangle vocalique de 5 apprenantes et 5 natives", 
      line = 3, adj = 0)
dev.off()
# View(totalfemme)
#legend.kwd = "bottomleft", 
#legend.args = list(seg.len = 2, cex = 1.2, lwd = 1),
# write.table(totalhomme,"/Users/rosingle/Desktop/praatscript/output/totalhomme2.txt",sep="\t",row.names = FALSE)
