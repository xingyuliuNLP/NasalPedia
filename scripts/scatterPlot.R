setwd("/Users/rosingle/Documents/theseAnalysis/20juin/Rgraphs")
library(dplyr)
library(ggplot2)
# library(ggpubr)
library(ggrepel)
compare = read.csv("/Users/rosingle/Documents/theseAnalysis/20juin/NOT/4formantsTotal.csv")
meanCompare <- compare %>%
    filter(group %in% c("mePreviousFrench","montagu")) %>%
    group_by(vowel,group) %>%
    summarise(f1 = round(mean(f1),0),
              f2 = round(mean(f2),0)) %>%
    print(n=11)
ggplot(meanCompare, aes(x = f2, y = f1, color=group,label = vowel,group = group)) +
    # scale_color_manual(values = c("#C02F1D","#108796")) +
    # geom_path() + 
    geom_text_repel(aes(label = paste(vowel,"^(",f1,"+",f2,")",sep = ""),color="group"),size = 4,nudge_y = -2,nudge_x = 3,
                    parse = TRUE) +
    stat_chull(aes(color = group, fill = group),
               alpha = 0.1, geom = "polygon") +
    scale_x_reverse() + scale_y_reverse() +
guides(color = FALSE) +
    theme_classic()

ggsave("previousMontagu.png")

















meanCompare <- compare %>%
    filter(group %in% c("chineseFr","montagu")) %>%
    group_by(vowel,group) %>%
    summarise(f1 = round(mean(f1),0),
              f2 = round(mean(f2),0)) %>%
    print(n=11)
graph = ggplot(meanCompare, aes(x = f2, y = f1, color=group,label = vowel)) +
    geom_point() +
    # scale_color_manual(values = c("#C02F1D","#108796")) +
    geom_text_repel(aes(label = paste(vowel,"^(",f1,"+",f2,")",sep = ""),color=group),size = 4,nudge_y = -2,nudge_x = 3,
                    parse = TRUE) +
    # stat_chull(aes(color = group, fill = group),
    #            alpha = 0.3, geom = "polygon") +
    scale_x_reverse() + scale_y_reverse()
ggsave("chineseFrenchMontagu.jpg")
ggplot(meanCompare, aes(x = f2, y = f1, color=group,label = vowel)) +
    geom_point() +
    # scale_color_manual(values = c("#C02F1D","#108796")) +
    geom_text_repel(aes(label = paste(vowel,"^(",f1,"+",f2,")",sep = ""),color=group),size = 4,nudge_y = -2,nudge_x = 3,
                    parse = TRUE) +
    # stat_chull(aes(color = group, fill = group),
    #            alpha = 0.3, geom = "polygon") +
    scale_x_reverse() + scale_y_reverse()
ggsave("previousMontagu.png")


# View(combinedData)
# set.seed(955)
# # Make some noisily increasing data
# dat <- data.frame(cond = rep(c("A", "B"), each=10),
#                   xvar = 1:20 + rnorm(20,sd=3),
#                   yvar = 1:20 + rnorm(20,sd=3))
# head(dat)
# Anything in the ggplot(aes()) function will apply to all other layers, unless they’re overridden. 
# filter package
library(dplyr)
library(ggplot2)
library(ggpubr)
library(ggrepel)

theme_set(
    theme_classic() +
        theme(legend.position = "top")
)
# change order
combinedData$vowel <- factor(combinedData$vowel, levels = c("a", "i", "u", "e", "E", "o", "O", "eu", "oe", "ainoral", "anoral", "angoral","ongoral","onoral"))
## get the means using summarise
means <- combinedData %>%
    summarise(mean_F1 = mean(f1),
              mean_F2 = mean(f2)) %>%
    print()

## get the means by vowel also change mean_F1 to f1 to save some retyping in geom_label
means <- combinedData %>%
    group_by(vowel) %>%
    summarise(f1 = round(mean(f1),0),
              f2 = round(mean(f2),0)) %>%
    print(n = 11)
View(means)

## plot label too
ggplot(combinedData, aes(x = f2, y = f1)) + 
    geom_point() + 
    theme_classic() +
    scale_x_reverse() + scale_y_reverse()


# plot label, mean and points
ggplot(combinedData,aes(x=f2,y=f1, color = language, shape = vowel)) +
    geom_text(aes(label = contexte)) +
    geom_point() +
    scale_shape_manual(values=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)) + # Use a hollow circle and triangle
    theme_classic() 

## what do I want ? color : by group, shape by vowel, polygon, geo_label = vowel
ggplot(combinedData, aes(x = f2, y = f1, color=language,label = vowel)) + 
    geom_label(data=means,alpha = 0.5,size=4,aes(fill = language), colour = "white", fontface = "bold") +
 geom_text(aes(label = paste(f1, f2, sep = " "))) +
    geom_point() +
    # geom_point() + 
    scale_shape_manual(values=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)) +  # Use a hollow circle and triangle
    # stat_ellipse(geom = "polygon", type = "t", alpha = 0.3, aes(fill = language)) +  # one standard deviation also make the labels override the ellipse
    stat_chull(aes(color = language, fill = language),
    alpha = 0.1, geom = "polygon") +
    # geom_label(data = means) +
    # geom_text_repel(aes(label = .vowelLabels,  color = language), size = 3) +
    # scale_color_manual(values = c("#00AFBB", "#E7B800")) +
    scale_x_reverse() + scale_y_reverse() + 
    # scale_color_discrete(breaks = c("a", "i", "u", "e", "E", "o", "O", "eu", "oe", "ainoral", "anoral", "angoral","ongoral","onoral"))  +
    guides(color = FALSE) +
    theme_classic()

##### plot means and superpose points 
.vowelLabels = means$vowel
ggplot(means, aes(x = f2, y = f1, color=language,label = vowel)) + 
    # geom_text(data=means) +
    # ,alpha = 0.5,size=4,aes(fill = language), colour = "white", fontface = "bold"
    geom_point() +
    scale_color_manual(values = c("#C02F1D","#108796")) +
    # geom_label_repel(aes(label = .vowelLabels), size = 4)+
    geom_text_repel(aes(label = paste(vowel,"^(",f1,"+",f2,")",sep = ""),color=language),size = 4,nudge_y = -2,nudge_x = 3,
                    parse = TRUE) +
    # geom_point() + 
    # scale_shape_manual(values=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)) +  # Use a hollow circle and triangle
    # stat_ellipse(geom = "polygon", type = "t", alpha = 0.3, aes(fill = language)) +  # one standard deviation also make the labels override the ellipse
    stat_chull(aes(color = language, fill = language),
               alpha = 0.3, geom = "polygon") +
    # geom_line(aes(linetype=language))+
    # geom_label(data = means) +
    # geom_text_repel(aes(label = .vowelLabels,  color = language), size = 3) +
    scale_x_reverse() + scale_y_reverse() + 
    # scale_color_discrete(breaks = c("a", "i", "u", "e", "E", "o", "O", "eu", "oe", "ainoral", "anoral", "angoral","ongoral","onoral"))  +
    guides(color = FALSE) +
    theme_classic()

class(combinedData$language)


# plot babels again
ggplot(combinedData, aes(x=f2, y=f1, color=vowel,label = vowel)) +
    geom_point() +
    theme_classic() + # black 
scale_x_reverse() + scale_y_reverse() 
    # geom_point(size=2, shape=23) 

ggplot(dat, aes(x=xvar, y=yvar)) +
    geom_point(shape=1)      # Use hollow circles

ggplot(dat, aes(x=xvar, y=yvar)) +
    geom_point(shape=1) +    # Use hollow circles
    geom_smooth(method=lm)   # Add linear regression line 
#  (by default includes 95% confidence region)

ggplot(dat, aes(x=xvar, y=yvar)) +
    geom_point(shape=1) +    # Use hollow circles
    geom_smooth(method=lm,   # Add linear regression line
                se=FALSE)    # Don't add shaded confidence region

# Set color by cond
ggplot(dat, aes(x=xvar, y=yvar, color=cond)) + geom_point(shape=1)

# Same, but with different colors and add regression lines
ggplot(dat, aes(x=xvar, y=yvar, color=cond)) +
    geom_point(shape=1) +
    scale_colour_hue(l=50) + # Use a slightly darker palette than normal
    geom_smooth(method=lm,   # Add linear regression lines
                se=FALSE)    # Don't add shaded confidence region

# Extend the regression lines beyond the domain of the data
ggplot(dat, aes(x=xvar, y=yvar, color=cond)) + geom_point(shape=1) +
    scale_colour_hue(l=50) + # Use a slightly darker palette than normal
    geom_smooth(method=lm,   # Add linear regression lines
                se=FALSE,    # Don't add shaded confidence region
                fullrange=TRUE) # Extend regression lines

# Set shape by cond
ggplot(dat, aes(x=xvar, y=yvar, shape=cond)) + geom_point()

# Same, but with different shapes
ggplot(dat, aes(x=xvar, y=yvar, shape=cond)) + geom_point() +
    scale_shape_manual(values=c(1,2))  # Use a hollow circle and triangle


x_val<-c(0.05,0.10,-0.35,-0.20,-0.09,0.43,0.63,0.60, 0.41,0.02,-0.18,0.19,-0.22,0.49,0.20,-0.01,-0.37, -0.48,-0.24,0.21,0.29,-0.18,0.28,-0.22,0.10,0.00,-0.55,0.00,-0.39,-0.43,0.00,0.19,-0.16,0.32,-0.44)
y_val<-c(0.49,-0.40,0.22,0.20,0.03,-0.14,-0.06,0.16,0.20,-0.21,0.42,-0.04,0.13,-0.32,-0.52,0.49,-0.41,-0.13,-0.47,0.33,0.35,0.47,-0.24,0.05,-0.44,0.24,0.20,0.16,-0.22,-0.26,-0.10,-0.04,-0.34,0.13,0.06)
group<-c(4,3,4,6,6,1,1,1,1,3,2,4,6,1,3,6,7,7,5,6,6,6,3,2,3,2,7,6,5,5,6,6,5,6,5)
plot_num<-c(1:35)
my_data<-as.data.frame(cbind(x_val,y_val,group,plot_num),35,4)
plot_col<-c("#83FEA7","#8D1E47","#2BBCB3","#4DB623","#648900","#D460B4","#FF747B","#FAAA94","#D0B5CA","#7D4ED7","#51EEE7","#A079E7","#48A380","#E23195","#A30088","#75FF38","#271CD4","#1061C3","#430B7C","#A6D585","#B7DB50","#50FA64","#B54638","#4890F3","#8D13C0","#78C0FF","#00B584","#77AC2C","#224C41","#1C4278","#77683D","#A1790F","#542E2F","#BDA332","#199338")
group_col<-c("#E67AA1","#5BBFF3","#962786","#6FBBC0","#304552","#7EB440","#1266B4")
find_hull <- function(my_data) my_data[chull(my_data[,1], my_data[,2]), ]
hulls <- ddply(my_data, "group", find_hull)
# make a color vector from group column
g.col <- group_col[hulls$group]

FF <- ggplot(data = my_data, aes(x_val,y_val)) +  
    geom_polygon(data = hulls, alpha = 0.5, aes(fill=factor(group))) +  # fill
    geom_polygon(data = hulls, alpha = 0, aes(group=factor(group)), colour=g.col) + # draw lines with specific color
    scale_fill_manual(values= group_col)  # change fill color.
FF +  geom_point(data = my_data, aes(x_val, y_val, colour=factor(plot_num)), size=4) +
    scale_color_manual(values=plot_col) 
