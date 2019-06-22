library(MASS)
datafr = read.table('/Users/rosingle/Documents/theseEcriture/Etat_these/dataAero/datacnfr_normal_combined.txt',header = TRUE)
datatruefr = read.table('/Users/rosingle/Documents/theseEcriture/Etat_these/dataAero/datafr_normal.txt',header = TRUE)
View(datatruefr)
datafr.oral =  datafr[datafr$partie=='oral',]
View(datafr.oral)
datafr.nasal =  datafr[datafr$partie=='nasal',]
View(datafr.nasal)
a = cbind(datafr.oral,datafr.nasal[,4])
a$pourcentage = round((a[,4]/(a[,6]+a[,4]))*100,0)
View(a)
agood = a[a$groupe=='good',]$pourcentage
agood.ain = a[a$groupe=='good' & a$voyelle=='ain',]$pourcentage
agood.ang = a[a$groupe=='good' & a$voyelle=='an',]$pourcentage
agood.on = a[a$groupe=='good' & a$voyelle=='on',]$pourcentage
abad.ain = a[a$groupe=='bad' & a$voyelle=='ain',]$pourcentage
abad.ang = a[a$groupe=='bad' & a$voyelle=='an',]$pourcentage
abad.on = a[a$groupe=='bad' & a$voyelle=='on',]$pourcentage
mean(agood)
sd(agood)
abad = a[a$groupe=='bad',]$pourcentage
mean(abad)
sd(abad)
ind.t.test = t.test(agood, abad)
t<-ind.t.test$statistic[[1]]
df<-ind.t.test$parameter[[1]]
r <- sqrt(t^2/(t^2+df))
round(r, 3)
t.test(agood.ain, abad.ain)
t.test(agood.ang, abad.ang)
t.test(agood.on, abad.on)


datatruefr.oral =  datatruefr[datatruefr$partie=='oral',]
datatruefr.nasal =  datatruefr[datatruefr$partie=='nasal',]
View(datatruefr.nasal)
b = cbind(datatruefr.oral,datatruefr.nasal[,4])
b$pourcentage = round((b[,4]/(b[,5]+b[,4]))*100,0)
head(b)
bgood.ain = b[b$voyelle=='ain',]$pourcentage
head(bgood.ain)
bgood.ang = b[b$voyelle=='an',]$pourcentage
bgood.on = b[b$voyelle=='on',]$pourcentage


# ind.t.test2 = t.test(b$pourcentage, agood)
# t<-ind.t.test2$statistic[[1]]
# df<-ind.t.test2$parameter[[1]]
# r2 <- sqrt(t^2/(t^2+df))
# round(r2, 3)
# ind.t.test2
# r2
# t.test(bgood.ain,agood.ain)
# t.test(bgood.ang,agood.ang)
# t.test(bgood.on,agood.on)






















datafr.oral =  datafr[datafr$partie=='oral',]
# View(datafr.oral)
datafr.nasal =  datafr[datafr$partie=='nasal',]
# View(datafr.nasal)
a = cbind(datafr.oral,datafr.nasal[,4])
a$pourcentage = round((a[,4]/(a[,6]+a[,4]))*100,0)
View(a)
agood = a[a$groupe=='good',]$pourcentage
agood.ain = a[a$groupe=='good' & a$voyelle=='ain',]$pourcentage
agood.ang = a[a$groupe=='good' & a$voyelle=='an',]$pourcentage
agood.on = a[a$groupe=='good' & a$voyelle=='on',]$pourcentage
abad.ain = a[a$groupe=='bad' & a$voyelle=='ain',]$pourcentage
abad.ang = a[a$groupe=='bad' & a$voyelle=='an',]$pourcentage
abad.on = a[a$groupe=='bad' & a$voyelle=='on',]$pourcentage
mean(agood)
sd(agood)
abad = a[a$groupe=='bad',]$pourcentage
mean(abad)
sd(abad)
ind.t.test = t.test(agood, abad)
t<-ind.t.test$statistic[[1]]
df<-ind.t.test$parameter[[1]]
r <- sqrt(t^2/(t^2+df))
round(r, 3)
t.test(agood.ain, abad.ain)
t.test(agood.ang, abad.ang)
t.test(agood.on, abad.on)


datafr1 = datafr[datafr$partie=='oral' & datafr$voyelle == 'ain',]

datafr2 = datafr[datafr$partie=='oral' & datafr$voyelle == 'an',]
datafr3 = datafr[datafr$partie=='oral' & datafr$voyelle == 'on',]
# datafr4 = datafr[datafr$partie=='oral' & datafr$groupe == 'good' ,]
# datafr4.1 = datafr4[datafr$partie=='oral' & datafr$groupe == 'good' ,]
# datafr4.2 = datafr[datafr$partie=='oral' & datafr$groupe == 'good' ,]
# datafr4.3 = datafr[datafr$partie=='oral' & datafr$groupe == 'good' ,]
# datafr5.1 = datafr[datafr$partie=='oral' & datafr$groupe == 'bad' ,]
# datafr5.2 = datafr[datafr$partie=='oral' & datafr$groupe == 'bad' ,]
# datafr5.3 = datafr[datafr$partie=='oral' & datafr$groupe == 'bad' ,]
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
# datafr = datafr[datafr$partie=='oral',]
# head(datafr)
# par(mfrow = c(1, 2))
# truehist(datafr$durée,col = "lightgrey", xlab = "durée", ylab = 'fréquence relative')
# plot(density(datafr$durée))
# #boxplot(datafr$durée,ylab ="durée de la partie orale", xlab ="fr")
# shapiro.test(datafr$durée)

