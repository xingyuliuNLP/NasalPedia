# this is to convert long formant data to wide trajectory data, i.e. 8 point
datawang = read.csv("/Users/rosingle/Documents/theseAnalysis/20juin/output/wangfr.txt")
# datawang = reshape(dat1, idvar = "vowel", timevar = "percentage", direction = "wide")
View(datawang)
# write.table(dat2,'/Users/rosingle/Documents/theseAnalysis/output/wangfrwide.txt',sep="\t",row.names = F)