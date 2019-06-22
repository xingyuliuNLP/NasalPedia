library(phonR)
path = '/Users/rosingle/Documents/theseEcriture/Etat_these/formantdata'
totalhomme = read.table(paste(path,'/cncombined.txt',sep=""),header=T)
formantfr = read.table(paste(path,'/fr.txt',sep=""),header=T)
#View(totalhomme)
par(mfrow=c(1,2))
remapping <- c(eu ="ø", oe = "œ", bigo = "ɔ",i = "i", a = "a", e = "e", bige = "ɛ", u = "u", y = "y", o = "o", acn = 'acn' , icn = 'icn', ucn = 'ucn', angcn = 'aŋ',aincn = 'an', oncn = 'uŋ', ang = 'ɑ̃' , ain = 'ɛ̃',on = 'ɔ̃')
totalhomme$unicodevowel <- remapping[as.character(totalhomme$voyelle)]
formantfr$unicodevowel <- remapping[as.character(formantfr$voyelle)]
#View(totalhomme)
totalhomme1 = totalhomme[totalhomme$groupe=="groupe1",]
head(totalhomme1)
totalhomme2 = totalhomme[totalhomme$groupe=="groupe2",]
with(totalhomme1, plotVowels(f1, f2, voyelle, plot.tokens = FALSE, pch.tokens = voyelle, cex.tokens = 1.2, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 2, var.col.by = unicodevowel,ellipse.line = TRUE, pretty = TRUE))
legend("bottomleft", legend="Groupe1",
       col="red", lty=1, cex=1)
# with(totalhomme2, plotVowels(f1, f2, voyelle, plot.tokens = FALSE, pch.tokens = voyelle, cex.tokens = 1.2, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 2, var.col.by = unicodevowel,ellipse.line = TRUE, pretty = TRUE))
# legend("bottomleft", legend="Groupe2",
#        col="blue", lty=2, cex=0.8)

# with(totalhomme2, plotVowels(f1, f2, voyelle, plot.tokens = FALSE, pch.tokens = voyelle, cex.tokens = 1.2, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 2, var.col.by = unicodevowel,ellipse.line = TRUE, pretty = TRUE))
# legend("bottomleft", legend="Groupe2",
#        col="blue", lty=2, cex=1)

with(formantfr, plotVowels(f1, f2, voyelle, plot.tokens = FALSE, pch.tokens = voyelle, cex.tokens = 1.2, alpha.tokens = 0.2, plot.means = TRUE, pch.means = unicodevowel, cex.means = 2, var.col.by = unicodevowel,ellipse.line = TRUE, pretty = TRUE,ylim = c(1200, 200),xlim = c(3500,500)))
legend("bottomleft", legend="natives",
       col="red", lty=1, cex=1)

#View(totalhomme1)
t.test(totalhomme1[totalhomme1$voyelle=='on',]$f1,formantfr[formantfr$voyelle=='on',]$f1)
