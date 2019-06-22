dat = read.table('/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/perceptionAmongNasals.txt',sep="\t")
dat= dat[2:112,]
colnames(dat)=c('stimulus','response')
# View(dat)
# table_absolu = table(dat$stimulus, dat$response)
result  = xtabs(~stimulus+response,data=dat)
prop.table(result,2)
# round(prop.table(table_absolu)*100,0)
