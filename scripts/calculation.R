my_data <- PlantGrowth

my_data$group <- ordered(my_data$group,
                         levels = c("ctrl", "trt1", "trt2"))
group_by(my_data, group) %>%
    summarise(
        mean = mean(weight, na.rm = TRUE),
        sd = sd(weight, na.rm = TRUE)
    )

chineseFrench = read.table("/Users/rosingle/Documents/theseAnalysis/20juin/NOT/NOTChineseFrench1.txt",header = T)
chinese = read.table("/Users/rosingle/Documents/theseAnalysis/20juin/NOT/NOTChinese1.txt",header = T)


with(chineseFrench,tapply(oralDuration,speed,mean))
with(chinese,tapply(oralDuration,speed,mean))
chineseFrench$oralDuration = round(chineseFrench$oralDuration)
chineseFrench$nasalDuration = round(chineseFrench$nasalDuration)
chineseFrench$oralPerc = round(chineseFrench$oralPerc)
chineseFrench$nasalPerc = round(chineseFrench$nasalPerc)
chineseFrench$totalDuration = round(chineseFrench$totalDuration)
View(chineseFrench)

# select a specific combination

chinese[chinese$consonant == "m" & chinese$vowel == "ong" & chinese$speed == "s",]$oralDuration

chinese$consonant == "m" & chinese$vowel == "ong"& chinese$speed == "s"


# chineseFrench part

chineseFrench$consonant <- ordered(chineseFrench$consonant,
                         levels = c("m", "n", "p","t","s","l"))

a = with(chineseFrench, tapply(oralPerc, list(consonant, vowel,speed), mean))
round(a)



chinese$consonant <- ordered(chinese$consonant,
                         levels = c("m", "n", "p","t","s","l"))
View(chinese)
b = with(chinese, tapply(oralPerc, list(consonant, vowel,speed), mean))
round(b)

b-a

aggregate(chinese[, 7:length(chinese)], list(chinese$vowel), mean)

group_by(chineseFrench, vowel) %>%
    summarise(
        oralDuration = mean(oralDuration, na.rm = TRUE),
        sd = sd(oralDuration),
        nasalDuration = mean(nasalDuration),
        totalDuration = mean(totalDuration)
            )

sapply(chineseFrench[chineseFrench$vowel == "on", 7:length(mandarin)], mean)

summary = aggregate(mandarin[, 7:length(mandarin)], list(mandarin$vowel), mean)
round(summary[,2:(length(mandarin)-7)])
with(mandarin,tapply(oralPerc,list(consonant,vowel),mean))
# draw 