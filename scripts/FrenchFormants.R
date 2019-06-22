oral = 10
ang = 10
ain = 8
on = 7
f1i = 278
sdi = 28
f1e = 500
sde = 35
f1bige = 580
sdbige = 67
f1a = 800
sda = 58
f1y = 276
sdy = 36
f1eu = 450
sdeu = 39
f1oe = 599
sdoe = 70
f1u = 295
sdu = 27
f1o = 415
sdo = 33
f1bigo = 595
sdbigo = 88
    f2i = 2680
    sd2i = 157
    f2e = 2450
    sd2e = 132
    f2bige = 2306
    sd2bige = 129
    f2a = 1480
    sd2a = 156
    f2y =2091
    sd2y = 130
    f2eu =1599
    sd2eu =144
    f2oe =1678
    sd2oe =122
    f2u =873
    sd2u = 80
    f2o =950
    sd2o =102
    f2bigo =1300
    sd2bigo =123
    f1ang = 545
    sdang = 80
    f1ain = 612
    sdain = 33
        f1on = 430
        sdon =29
    f2ang = 1004
    sd2ang = 67
    f2ain = 1359
    sd2ain = 84
        f2on = 856
        sd2on = 67
    
    


frformants = data.frame(
    c(rep('i', oral ), rep('e', oral ), rep('bige', oral ), rep('a', oral ), rep('y', oral ), rep('eu', oral ), rep('oe', oral ), rep('u', oral ), rep('o', oral ), rep('bigo', oral ),rep('ang', ang ),rep('ain', ain ),rep('on', on)),
# F1
    c(rnorm(oral,f1i,sdi),rnorm(oral,f1e,sde),rnorm(oral,f1bige,sdbige),rnorm(oral,f1a,sda),rnorm(oral,f1y,sdy),rnorm(oral,f1eu,sdeu),rnorm(oral,f1oe,sdoe),rnorm(oral,f1u,sdu),rnorm(oral,f1o,sdo),rnorm(oral,f1bigo,sdbigo),rnorm(ang,f1ang,sdang),rnorm(ain,f1ain,sdain),rnorm(on,f1on,sdon)),

# F2
c(rnorm(oral,f2i,sd2i),rnorm(oral,f2e,sd2e),rnorm(oral,f2bige,sd2bige),rnorm(oral,f2a,sd2a),rnorm(oral,f2y,sd2y),rnorm(oral,f2eu,sd2eu),rnorm(oral,f2oe,sd2oe),rnorm(oral,f2u,sd2u),rnorm(oral,f2o,sd2o),rnorm(oral,f2bigo,sd2bigo),rnorm(ang,f2ang,sd2ang),rnorm(ain,f2ain,sd2ain),rnorm(on,f2on,sd2on)))

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
write.table(frformants,'/Users/rosingle/blog/piezo/Etat_these/formantdata/fr.txt',row.names = FALSE)
write.table(frformants_complete,'/Users/rosingle/blog/piezo/Etat_these/formantdata/frsummary.txt',row.names = FALSE)