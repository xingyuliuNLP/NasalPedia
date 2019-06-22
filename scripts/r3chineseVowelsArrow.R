# simulate some diphthongs; not terribly realistic values
library(phonR)
totalhomme = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/chineseDiphtonguesManArrow.txt',sep="\t",header=T)
# totalhomme = read.csv("/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/chineseManDiphTriph.csv")
remapping <- c(.ai="ai", .ao="au",.ei='ei',.ia='ia',.ie='ie',iou='iou',.ou='ou',.wa='wa',.wo='wo',.ye='ye',iao='iao',wai='wai',wei='wei',i='i',a='a',u='u',y='y',ee='ɤ')
totalhomme$unicodevowel <- remapping[as.character(totalhomme$vowel)]

totalhomme_diphtongue_kaikou = totalhomme[c(1:4,14:18),] 
# totalhomme_diphtongue_kaikou = totalhomme[c(1:4,14:18),] 
# totalhomme_diphtongue_hekou = totalhomme[c(5:8,14:18),]
# i a ee
totalhomme_diphtongue_hekou = totalhomme[c(5:8,14,15,16),]

totalhomme_diphtongue_qichipluscuokou = totalhomme[c(9:13,15,16,17),]
# totalhomme_diphtongue_qichi = totalhomme[c(14:18),]


# totalhomme_triphtongue = totalhomme[c(7:18),]
    
svg("chineseManDiphArrow0.svg")
with(totalhomme_diphtongue_kaikou, plotVowels(cbind(f1.1, f1.2, f1.3, f1.4, f1.5,f1.6,f1.7,f1.8), cbind(f2.1, f2.2, f2.3, f2.4, f2.5,f2.6,f2.7,f2.8), unicodevowel, plot.tokens = FALSE, pch.tokens = NA, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1.3, var.col.by = unicodevowel, pretty = TRUE, diph.arrows = TRUE, diph.args.tokens = list(lwd = 0.8), diph.args.means = list(lwd = 3), family = "Charis SIL"))
title(main = "Trajectoire formantique (série sans médiane)", 
      line = 3, adj = 0)
dev.off()

svg("ChineseManDiphArrowW.svg")
with(totalhomme_diphtongue_hekou, plotVowels(cbind(f1.1, f1.2, f1.3, f1.4, f1.5,f1.6,f1.7,f1.8), cbind(f2.1, f2.2, f2.3, f2.4, f2.5,f2.6,f2.7,f2.8), unicodevowel, plot.tokens = FALSE, pch.tokens = NA, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1.3, var.col.by = unicodevowel, pretty = TRUE, diph.arrows = TRUE, diph.args.tokens = list(lwd = 0.8), diph.args.means = list(lwd = 3), family = "Charis SIL"))
title(main = "Trajectoire formantique (série /w/)", 
      line = 3, adj = 0)
dev.off()

svg("ChineseManDiphArrowIY.svg")
with(totalhomme_diphtongue_qichipluscuokou, plotVowels(cbind(f1.1, f1.2, f1.3, f1.4, f1.5,f1.6,f1.7,f1.8), cbind(f2.1, f2.2, f2.3, f2.4, f2.5,f2.6,f2.7,f2.8), unicodevowel, plot.tokens = FALSE, pch.tokens = NA, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1.3, var.col.by = unicodevowel, pretty = TRUE, diph.arrows = TRUE, diph.args.tokens = list(lwd = 0.8), diph.args.means = list(lwd = 3), family = "Charis SIL"))
title(main = "Trajectoire formantique (série /j ɥ/)", 
      line = 3, adj = 0)
dev.off()

svg("ChineseManDiphArrowAll.svg")
with(totalhomme, plotVowels(cbind(f1.1, f1.2, f1.3, f1.4, f1.5,f1.6,f1.7,f1.8), cbind(f2.1, f2.2, f2.3, f2.4, f2.5,f2.6,f2.7,f2.8), unicodevowel, plot.tokens = FALSE, pch.tokens = NA, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 1.3, var.col.by = unicodevowel, pretty = TRUE, diph.arrows = TRUE, diph.args.tokens = list(lwd = 0.8), diph.args.means = list(lwd = 3), family = "Charis SIL"))
title(main = "Trajectoire formantique (toutes les voyelles en chinois)", 
      line = 3, adj = 0)
dev.off()
