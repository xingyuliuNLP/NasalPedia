library(phonR)
womenApprenante = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/diphWomenLearnerFrench.txt',sep="\t",header=T)
remapping <- c(eu='ø',oe = 'œ',a='a',i='i',e='e',ai='ɛ',o='o',u='u',y='y',ao='ɔ')
womenApprenante$unicodevowel <- remapping[as.character(womenApprenante$vowel)]
svg("diphChineseWomenLearners.svg")
with(womenApprenante, plotVowels(cbind(f1.1, f1.2, f1.3, f1.4, f1.5,f1.6,f1.7,f1.8), cbind(f2.1, f2.2, f2.3, f2.4, f2.5,f2.6,f2.7,f2.8), unicodevowel, plot.tokens = FALSE, pch.tokens = NA, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1.3, var.col.by = unicodevowel, pretty = TRUE, diph.arrows = TRUE, diph.args.tokens = list(lwd = 0.8), diph.args.means = list(lwd = 3), family = "Charis SIL"))
title(main = "Trajectoire formantique des voyelles produites par 5 apprenantes", 
      line = 3, adj = 0)
dev.off()
