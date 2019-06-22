library(showtext)

# library
library(ggplot2)
font.add('SimSun', regular = '/Library/Fonts/Microsoft/SimHei.ttf')
theme<-theme_get()
#using the Chinese fonts you have, check it with font book.  
theme$text$family<-"STFangsong"
theme_set(theme)
# showtext_auto()

# create a dataset
dat1 <- data.frame(
    titre = factor(c("Comprenant le mot « anglais »","Comprenant le mot « anglais »","Comprenant le mot « anglais »","Comprenant le mot « anglais »","Sans le mot « anglais »","Sans le mot « anglais »","Sans le mot « anglais »","Sans le mot « anglais »")),
    mots_clés = factor(c("法语语音(pf)","法语元音(vf)","法语辅音(cf)","法语鼻化元音(vnf)","法语语音(pf)","法语元音(vf)","法语辅音(cf)","法语鼻化元音(vnf)"), levels=c("法语语音(pf)","法语元音(vf)","法语辅音(cf)","法语鼻化元音(vnf)")),
    nombre_articles = c(54,10,6,0,194,21,10,1)
)
# dat1 <- data.frame(
#     sex = factor(c("Female","Female","Male","Male")),
#     mot_cles = factor(c("(Lunch)","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
#     total_bill = c(13.53, 16.81, 16.24, 17.42)
# )

ggplot(data=dat1, aes(x=mots_clés, y=nombre_articles, fill=titre)) +
    geom_bar(stat="identity") + scale_fill_grey() + theme(panel.background=element_blank(),text = element_text(size = 17))+ coord_flip()
# Grouped

# ggplot(data, aes(fill=condition, y=value, x=specie)) + 
    # geom_bar(position="dodge", stat="identity")

# Stacked



# Stacked Percent
#ggplot(data, aes(fill=condition, y=value, x=specie)) +
    #geom_bar( stat="identity", position="fill")
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
df <- ToothGrowth
head(df)
library(ggplot2)
bp <- ggplot(df, aes(x=dose, y=len, group=dose)) + 
    geom_boxplot(aes(fill=dose))
bp
bp + facet_grid(supp ~ .)
bp + facet_grid(. ~ supp)

