library(phonR)
# data(indoVowels)  # provides dataframe 'indo'
totalfemme = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/formantFillesComplet.txt',sep="\t",header=T)
#View(totalfemme)
# with(totalfemme, plotVowels(f2, f3))
with(totalfemme, plotVowels(f1, f2))
with(totalfemme, plotVowels(f1, f2, vowel = vowel, group = gender))
remapping <- c(eu ="ø", oe = "œ", ao = "ɔ",i = "i", a = "a", e = "e", ai = "ɛ", u = "u", y = "y", o = "o",angfr = "ɑ̃",onfr ="ɔ̃",ainfr = "ɛ̃" ,ang="ang" ,on="on" ,an="an" )
totalfemme$unicodevowel <- remapping[as.character(totalfemme$vowel)]
# View(totalfemme)
with(totalfemme, plotVowels(f1, f2, vowel, ylim = c(1100, 200),group = gender, plot.tokens = FALSE, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1, var.col.by = gender, poly.line = TRUE,ellipse.fill = FALSE, legend.kwd = "bottomleft", pretty = TRUE),legend.args = list(seg.len = 0.2, cex = 0.5, lwd = 1))
# poly.line = FALSE, poly.order = c("i", "e","ai","a","ao","o", "u", "y")
# View(totalfemme)
#legend.kwd = "bottomleft", 
#legend.args = list(seg.len = 2, cex = 1.2, lwd = 1),
# write.table(totalfemme,"/Users/rosingle/Desktop/praatscript/output/totalfemme2.txt",sep="\t")
