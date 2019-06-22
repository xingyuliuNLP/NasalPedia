# Create données 
# 50 100 200
f1_a = 1011
f1_i = 270
f1_u = 359
f1_ee = 586
f2_a = 1556
f2_i = 2642
f2_u = 744
f2_ee = 1392
ecart_type_f1 = 56
ecart_type_f2 = 89
ecart_type_f3 = 168
nombre_locutrice = 5
nombre_repetition = 1
nombre_contexte = 1
total_token = nombre_locutrice * nombre_repetition * nombre_contexte


data1 = data.frame(c(rep('01',nombre_locutrice),rep('02',nombre_locutrice),rep('03',nombre_locutrice) ,rep('04',nombre_locutrice),rep('05',nombre_locutrice)) , rep('ch',total_token),c(rep('a',total_token),rep('i',total_token),rep('ɤ',total_token) ,rep('u',total_token)) , c(rnorm(total_token,f1_a,ecart_type_f1),rnorm(total_token,f1_i,ecart_type_f1))
                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                  rnorm(,60,4),rnorm(40,60,4),rnorm(40,60,4))
                   
                   
)