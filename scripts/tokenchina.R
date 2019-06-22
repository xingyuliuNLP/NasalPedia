nombre_token_parvoyelle = 20
partie = 2

datafr_lent = data.frame(
    c(rep('ain',nombre_token_parvoyelle * partie ),rep('an',nombre_token_parvoyelle * partie),rep('on',nombre_token_parvoyelle * partie)),
    c(rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle),rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle),rep('oral',nombre_token_parvoyelle),rep('nasal',nombre_token_parvoyelle)),
    c(rep('normal',nombre_token_parvoyelle * partie * 3)),
    c(rnorm(nombre_token_parvoyelle,63,13),rnorm(nombre_token_parvoyelle,154,28),rnorm(nombre_token_parvoyelle,62,28),rnorm(nombre_token_parvoyelle,148,33),rnorm(nombre_token_parvoyelle,72,37),rnorm(nombre_token_parvoyelle,153,40))
)
colnames(datafr_lent) = c("voyelle","partie","vitesse","durée")
datafr_lent$durée =  round(datafr_lent$durée,0)
datafr_lent
# View(datafr_lent)
write.table(datafr_lent,'/Users/rosingle/blog/piezo/Etat_these/data/datacn_normal_goodgroup.txt',row.names = FALSE)