# THis is to make the index
path_audio_piezo = '/Users/rosingle/Documents/theseEcriture/stereoXingyuWithScript/nasal/piezoTest/'
dat11 = read.table('/Users/rosingle/Documents/theseEcriture/stereoXingyuWithScript/nasal/piezoTest/Audio1_test_audio.txt',sep='')
dat22 = read.table('/Users/rosingle/Documents/theseEcriture/stereoXingyuWithScript/nasal/piezoTest/Audio1_test_piezo.txt',sep='')
# View(dat22)
dim(dat11)
dim(dat22)
dat3 = dat22/dat11
max(dat3)
dat4 = (dat3/max(dat3)) 
View(dat4)







write.table(dat4,'/Users/rosingle/Documents/theseEcriture/stereoXingyuWithScript/nasal/piezoTest/testhonc.txt',row.names = FALSE,col.names = FALSE)
