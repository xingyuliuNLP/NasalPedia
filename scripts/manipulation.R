my_data <- PlantGrowth
library(dplyr)
my_data$group <- ordered(my_data$group,
                         levels = c("ctrl", "trt1", "trt2"))

# combine graphs
library("ggpubr")
ggboxplot(my_data, x = "group", y = "weight", 
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("ctrl", "trt1", "trt2"),
          ylab = "Weight", xlab = "Treatment")
ggline(my_data, x = "group", y = "weight", 
       add = c("mean_se", "jitter"), 
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weight", xlab = "Treatment")
second
# ggarrange(first, second, 
#           labels = c("A", "B"),
#           ncol = 2, nrow = 1)

boxplot(weight ~ group, data = my_data,
        xlab = "Treatment", ylab = "Weight",
        frame = FALSE, col = c("#00AFBB", "#E7B800", "#FC4E07"))


