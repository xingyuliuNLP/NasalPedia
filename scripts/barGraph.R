mandarin = read.table("/Users/rosingle/Downloads/resultatsFR.txt",header = T)

dat <- data.frame(
    sex = factor(c("Female","Female","Male","Male")),
    time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
    total_bill = c(13.53, 16.81, 16.24, 17.42)
)
dat
# the height of the bar will represent the value in a column of the data frame. This is done by using stat="identity"

library(ggplot2)
ggplot(data=dat, aes(x=time, y=total_bill, fill=sex)) +
    geom_bar(stat="identity")

# Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
ggplot(data=dat, aes(x=time, y=total_bill, fill=sex)) +
    geom_bar(stat="identity", position=position_dodge())
# add black box
ggplot(data=dat, aes(x=time, y=total_bill, fill=sex)) +
    geom_bar(stat="identity", position=position_dodge(), colour="black")

# Change colors
ggplot(data=dat, aes(x=time, y=total_bill, fill=sex)) +
    geom_bar(stat="identity", position=position_dodge(), colour="black") +
    scale_fill_manual(values=c("#999999", "#E69F00"))

# basic
ggplot(data=dat, aes(x=time, y=total_bill)) +
    geom_bar(stat="identity")

# Map the time of day to different fill colors, one factor
ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) +
    geom_bar(stat="identity")


# Add a black outline
ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) +
    geom_bar(colour="black", stat="identity")

# No legend, since the information is redundant
ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) +
    geom_bar(colour="black", stat="identity", fill="#DD8888",width=.8) +
    # guides(fill=FALSE) +
    xlab("Time of day") + ylab("Total bill") +
    ggtitle("Average bill for 2 people") +
    theme(plot.title = element_text(hjust = 0.5))


mandarin= read.table("/Users/rosingle/Downloads/resultatsCH.txt",header = T)
chineseFrench = read.table("/Users/rosingle/Downloads/resultatsFR.txt",header = T)
results = aggregate(mandarin[, 7:length(mandarin)], list(mandarin$vowel), mean)
View(results)
results2 = aggregate(chineseFrench[, 7:length(chineseFrench)], list(chineseFrench$vowel), mean)
View(results2)
