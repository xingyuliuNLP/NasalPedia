# how to combine data and add groups

# a = read.table('/Users/rosingle/Documents/theseEcriture/Etat_these/formantdata/cn1.txt',header = T)
# b= read.table('/Users/rosingle/Documents/theseEcriture/Etat_these/formantdata/cn2.txt',header = T)
# a$groupe = c('groupe1')
# b$groupe = c('groupe2')


a = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/formant/formantChinese1.txt',header = T)
b= read.table('/Users/rosingle/Documents/theseAnalysis/20juin/formant/formantChineseFrench1.txt',header = T)
a$language = c('mandarin')
b$language = c('chineseFrench')
#View(a)
c=rbind(a,b)
c
# View(c)
cStat =aggregate(c[, 4:6], list(c$vowel,c$language), mean)
cStat
round(cStat[,3:length(cStat)])
# with(c, tapply(f1, list(vowel,language), mean))
# View(c)
write.table(c,'/Users/rosingle/Documents/theseEcriture/stereoXingyuWithScript/nasal/formantTest/combined.txt',row.names = FALSE)
#View(c)

# $ combine cnfr and fr
# # c$locuteur = c(rep('fr',360),rep('cnfr',720)) 
# 
# # combine cnfr
# #c$groupe = c(rep('good',360),rep('bad',360)) 
# 
# # combine cn
# c$groupe = c(rep('good',120),rep('bad',120)) 