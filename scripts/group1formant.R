oral = 8
ang = 8
ain = 7
on = 6
angcn = 8
aincn = 8
oncn = 8
acn = 8
icn = 8
ucn = 8
f1i = 320
sdi = 39
f1e = 450
sde = 39
f1bige = 506
sdbige = 50
f1a = 840
sda = 79
f1y = 300
sdy = 40
f1eu = 470
sdeu = 20
f1oe = 540
sdoe = 45
f1u = 324
sdu = 31
f1o = 400
sdo = 28
f1bigo = 520
sdbigo = 68
f2i = 2650
sd2i = 129
f2e = 2402
sd2e = 80
f2bige = 2314
sd2bige = 84
f2a = 1400
sd2a = 123
f2y = 2053
sd2y = 67
f2eu = 1540
sd2eu = 79
f2oe = 1621
sd2oe = 102
f2u = 803
sd2u = 69
f2o = 802
sd2o = 86
f2bigo = 1200
sd2bigo = 120
f1ang = 603
sdang = 56
f1ain = 730
sdain = 41
f1on = 450
sdon = 24
f2ang = 1080
sd2ang = 80
f2ain = 1700
sd2ain = 89
f2on = 909
sd2on = 31


f1acn = 1000
sdacn = 78
f1icn = 320
sdicn = 39
f1ucn = 280
sducn = 30
f2acn = 1580
sd2acn = 80
f2icn = 2600
sd2icn = 270
f2ucn = 650
sd2ucn = 40
f1angcn = 940
sdangcn = 50
f1aincn = 831
sdaincn = 34
f1oncn = 525
sdoncn =  27
f2angcn = 1280
sd2angcn = 113
f2aincn = 1600
sd2aincn = 90 
f2oncn = 1070
sd2oncn = 70



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
write.table(frformants,'/Users/rosingle/blog/piezo/Etat_these/formantdata/cn1.txt',row.names = FALSE)
write.table(frformants_complete,'/Users/rosingle/blog/piezo/Etat_these/formantdata/cn1summary.txt',row.names = FALSE)