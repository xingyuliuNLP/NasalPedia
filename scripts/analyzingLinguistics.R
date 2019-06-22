library(languageR)
head(verbs, n = 10)
# show the fifth column
head(verbs[,5])
# show the fifth row
verbs[1,]
verbs$LengthOfTheme
verbs[,"LengthOfTheme"]
row1 = verbs[1,]
row1["RealizationOfRec"]
rs = c(638, 799, 390, 569, 567)
verbs[rs, ]
1:5
verbs[rs,1:3]
verbs[rs, c("RealizationOfRec" , "Verb" , "AnimacyOfRec" )]
verbs[verbs$AnimacyOfTheme == "animate" , ]
subset(verbs, AnimacyOfTheme == "animate" )
verbs[verbs$AnimacyOfTheme == "animate" & verbs$LengthOfTheme > 2, ]
rownames(verbs)
colnames(verbs)
# Whereas the row and column names are vectors of strings, non-numerical columns in a data frame are automatically converted by R into factors.
verbs$AnimacyOfRec = as.character(verbs$AnimacyOfRec)
verbs$AnimacyOfRec = as.factor(verbs$AnimacyOfRec)
verbs[order(verbs$RealizationOfRec), ]
class(verbs$AnimacyOfRec)
levels(verbs$AnimacyOfRec)
mean(verbs[verbs$AnimacyOfRec == "animate" , ]$LengthOfTheme)
mean(verbs[verbs$AnimacyOfRec != "animate" , ]$LengthOfTheme)
# calculate mean according to variables, value + factor
tapply(verbs$LengthOfTheme, verbs$AnimacyOfRec, mean)
with(verbs, tapply(LengthOfTheme, list(AnimacyOfRec, AnimacyOfTheme), mean))
