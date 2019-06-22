nombre_token_oral = 10
nombre_token_ang = 10
nombre_token_ain = 10
nombre_token_on = 10

datafr_lent = data.frame(
    c(rep('ain',nombre_token_parvoyelle * partie ),rep('an',nombre_token_parvoyelle * partie),rep('on',nombre_token_parvoyelle * partie)),
    c(rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle),rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle),rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle)),
    c(rep('normal',nombre_token_parvoyelle * partie * 3)),
    c(rnorm(nombre_token_parvoyelle,80,13),rnorm(nombre_token_parvoyelle,123,26),rnorm(nombre_token_parvoyelle,72,9),rnorm(nombre_token_parvoyelle,133,24),rnorm(nombre_token_parvoyelle,83,12),rnorm(nombre_token_parvoyelle,132,24))
)
colnames(datafr_lent) = c("voyelle","partie","vitesse","durée")
datafr_lent$durée =  round(datafr_lent$durée,0)
View(datafr_lent)
write.table(datafr_lent,'/Users/rosingta/datacnfr_normal_badgroup.txt',row.names = FALSE)