oral = 12
ang = 12
ain = 12
on = 12
angcn = 12
aincn = 12
oncn = 12
acn = 12
icn = 12
ucn = 12
f1i = 308
sdi = 38
f1e = 450
sde = 32
f1bige = 506
sdbige = 50
f1a = 1000
sda = 83
f1y = 289
sdy = 35
f1eu = 500
sdeu = 26
f1oe = 520
sdoe = 58
f1u = 300
sdu = 27
f1o = 400
sdo = 30
f1bigo = 450
sdbigo = 70
f2i = 2700
sd2i = 132
f2e = 2420
sd2e = 92
f2bige = 2350
sd2bige = 80
f2a = 1580
sd2a = 143
f2y = 2080
sd2y = 80
f2eu = 1550
sd2eu = 98
f2oe =1580
sd2oe =111
f2u = 780
sd2u = 78
f2o = 730
sd2o = 80
f2bigo = 830
sd2bigo = 99
f1ang = 798
sdang = 45
f1ain = 813
sdain = 23
f1on = 501
sdon = 31
f2ang = 1116
sd2ang = 92
f2ain = 1646
sd2ain = 100
f2on = 954
sd2on = 22


f1acn = 1056
sdacn = 80
f1icn = 310
sdicn = 32
f1ucn = 275
sducn = 16
f2acn = 1629
sd2acn = 87
f2icn = 2700
sd2icn = 220
f2ucn = 618
sd2ucn = 32
f1angcn = 917
sdangcn = 34
f1aincn = 813
sdaincn = 23
f1oncn = 505
sdoncn =  22
f2angcn = 1382
sd2angcn = 120
f2aincn = 1646
sd2aincn = 100 
f2oncn = 1000
sd2oncn = 80



frformants = data.frame(
    c(rep('i', oral ), rep('e', oral ), rep('bige', oral ), rep('a', oral ), rep('y', oral ), rep('eu', oral ), rep('oe', oral ), rep('u', oral ), rep('o', oral ), rep('bigo', oral ),rep('ang', ang ),rep('ain', ain ),rep('on', on),rep('acn', acn ),rep('icn', icn ),rep('ucn', ucn),rep('angcn', angcn ),rep('aincn', aincn ),rep('oncn', oncn)),
    # F1
    c(rnorm(oral,f1i,sdi),rnorm(oral,f1e,sde),rnorm(oral,f1bige,sdbige),rnorm(oral,f1a,sda),rnorm(oral,f1y,sdy),rnorm(oral,f1eu,sdeu),rnorm(oral,f1oe,sdoe),rnorm(oral,f1u,sdu),rnorm(oral,f1o,sdo),rnorm(oral,f1bigo,sdbigo),rnorm(ang,f1ang,sdang),rnorm(ain,f1ain,sdain),rnorm(on,f1on,sdon),rnorm(acn,f1acn,sdacn),rnorm(icn,f1icn,sdicn),rnorm(ucn,f1ucn,sducn),rnorm(angcn,f1angcn,sdangcn),rnorm(aincn,f1aincn,sdaincn),rnorm(oncn,f1oncn,sdoncn)),
    
    # F2
    c(rnorm(oral,f2i,sd2i),rnorm(oral,f2e,sd2e),rnorm(oral,f2bige,sd2bige),rnorm(oral,f2a,sd2a),rnorm(oral,f2y,sd2y),rnorm(oral,f2eu,sd2eu),rnorm(oral,f2oe,sd2oe),rnorm(oral,f2u,sd2u),rnorm(oral,f2o,sd2o),rnorm(oral,f2bigo,sd2bigo),rnorm(ang,f2ang,sd2ang),rnorm(ain,f2ain,sd2ain),rnorm(on,f2on,sd2on),rnorm(acn,f2acn,sd2acn),rnorm(icn,f2icn,sd2icn),rnorm(ucn,f2ucn,sd2ucn),rnorm(angcn,f2angcn,sd2angcn),rnorm(aincn,f2aincn,sd2aincn),rnorm(oncn,f2oncn,sd2oncn)))

colnames(frformants) = c("voyelle","f1","f2")

cdata1 <- ddply(frformants[,1:2], c('voyelle'), summarise,
                mean = round(mean(f1),0),
                sd   = round(sd(f1),0)
)
cdata2 <- ddply(frformants[,c(1,3)], c('voyelle'), summarise,
                mean = round(mean(f2),0),
                sd   = round(sd(f2),0)
)
frformants_complete = cbind(cdata1,cdata2[2:3])
colnames(frformants_complete) = c("voyelle","meanf1",'sdf1','meanf2',"sdf2")
#View(frformant_complete)
write.table(frformants,'/Users/rosingle/blog/piezo/Etat_these/formantdata/cn2.txt',row.names = FALSE)
write.table(frformants_complete,'/Users/rosingle/blog/piezo/Etat_these/formantdata/cn2summary.txt',row.names = FALSE)