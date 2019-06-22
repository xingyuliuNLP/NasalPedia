library("ggplot2")
library("reshape2")
library("dplyr")
library("devtools")

setwd('/Users/rosingle/Desktop/praatscript/output/')
rawdata = read.table('resultats_log_file4reformat.txt',sep = "\t",header = TRUE)
View(rawdata)
colnames(rawdata) <- c("file","Duration",
                       "f0ss","f1ss","f2ss","f3ss",
                       "f110","f210","f310",
                       "f120","f220","f320",
                       "f130","f230","f330",
                       "f140","f240","f340",
                       "f150","f250","f350",
                       "f160","f260","f360",
                       "f170","f270","f370",
                       "f180","f280","f380")
# View(rawdata)
# rawdata = read.table('rawgood.txt',sep = "\t",col.names = TRUE)
data.melt <- melt(rawdata, id.vars = c("file","Duration"))
data.melt$Locuteur <- ifelse(substr(rawdata$file,1,1) %in% c("h","f"), "Natif", "Apprenant")
data.melt$Sexe    <- ifelse(substr(rawdata$file,1,1) %in% c("h","m"), "Homme", "Femme")
# View(rawdata)
data.melt$Talker <- substr(data.melt$file,2,3)
data.melt$Vowel  <- substr(data.melt$file,4,5) %>% as.factor
levels(data.melt$Vowel)
IPA_vowels <- c("a", "ɤ",'i','u','y')
IPA_vowels
data.melt$Vowel.IPA <- IPA_vowels[as.numeric(data.melt$Vowel)]
Vowel_space_path <- c("a", "ee",'i','u','y')
data.melt$Vowel.ordered <- factor(data.melt$Vowel, levels = Vowel_space_path)
# Explicitly declare the number of each vowel in the vowel space path order
data.melt$Vowel.order.num <- as.numeric(data.melt$Vowel.ordered)
data.melt$measure <- substr(data.melt$variable, 1,2)

# take a look at what that line of code did,
# by sampling some rows with unique measurement types:
data.melt[c(1, 8000, 9000, 30600), c("variable","measure")]
data.melt$Time <- substr(data.melt$variable, 3,4) %>% as.numeric
unique(data.melt[, c("variable","Time")])
data.melt$variable <- NULL
data.f0 <- data.melt %>% 
    dplyr::filter(measure=="f0") %>%
    mutate(f0 = value) %>%
    select(-value)
data.ss <- data.melt[is.na(data.melt$Time),] %>% 
    arrange(file, Vowel.order.num, measure, Time) %>%
    mutate(formant = substr(measure, 2,2) %>% 
               as.character) %>%
    filter(measure != "f0") %>%
    left_join(., data.f0[,c("file","f0")]) %>%
    mutate(Frequency = value) %>%
    select(-value)

# Note that without the last two links in the pipe chain, 
# "value" is the column representing the formant frequency,
# and it is located pretty far to the left, while the formant number
# is located pretty far to the right. 
# to make this easier to work with, the "value" column is copied
# to a new column called "Frequency". 
data.long <- data.melt[!is.na(data.melt$Time),] %>% 
    arrange(file, Vowel.order.num, measure, Time) %>%
    mutate(formant = substr(measure, 2,2) %>% as.character) %>%
    left_join(., data.f0[,c("file","f0")]) %>%
    mutate(Frequency = value) %>%
    select(-value)

# We won't need these objects anymore, so clear them from the workspace
rm(rawdata, data.melt)
keep_one_formant <- function(data, formant){
    temp <- data[data$measure==formant,] %>% 
        select(-measure, -formant) %>%
        mutate(temp.formant = Frequency) %>%
        select(-Frequency)
    # rename the temporary column to match the input argument
    names(temp)[names(temp)=="temp.formant"] <- formant
    return(temp)
}
data.wide <- data.long %>% 
    keep_one_formant(., "f1") %>%
    left_join(., keep_one_formant(data.long, "f2")) %>%
    left_join(., keep_one_formant(data.long, "f3")) %>%
    group_by(file) %>%
    arrange(Time) %>% ungroup
data.wide.ss <-  data.ss %>% 
    keep_one_formant(., "f1") %>%
    left_join(., keep_one_formant(data.ss, "f2")) %>%
    left_join(.,keep_one_formant(data.ss, "f3")) %>%
    select(-Time) 
data.wide.ss.sum <- data.wide.ss %>% 
    group_by(Locuteur, Sexe, 
             Vowel, Vowel.ordered, Vowel.order.num, Vowel.IPA) %>%
    summarise(Duration = mean(Duration, na.rm = TRUE),
              f0.sd= (sd(f0, na.rm = TRUE)) %>% round(., 2),
              f1.sd= (sd(f1, na.rm = TRUE)) %>% round(., 1),
              f2.sd= (sd(f2, na.rm = TRUE)) %>% round(., 1),
              f3.sd= (sd(f3, na.rm = TRUE)) %>% round(., 1),
              f0= mean(f0, na.rm = TRUE) %>% round(., 1),
              f1= mean(f1, na.rm = TRUE) %>% round(., 0),
              f2= mean(f2, na.rm = TRUE) %>% round(., 0),
              f3= mean(f3, na.rm = TRUE) %>% round(., 0))
data.wide.visc.sum <- data.wide %>% 
    group_by(Locuteur, Sexe, Vowel, Vowel.IPA, Time) %>%
    summarise(f1.sd = sd(f1, na.rm=TRUE),
              f2.sd = sd(f2, na.rm=TRUE),
              f3.sd = sd(f3, na.rm=TRUE),
              f1 = mean(f1, na.rm=TRUE),
              f2 = mean(f2, na.rm=TRUE),
              f3 = mean(f3, na.rm=TRUE),
              Duration.sd = sd(Duration, na.rm=TRUE),
              Duration = mean(Duration, na.rm=TRUE)) %>%
    ungroup %>%
    # Encode duration as a normalized value between 0 and 1
    group_by(Locuteur, Sexe) %>%
    mutate(Duration_norm = (Duration - min(Duration)) / 
               ((max(Duration) - min(Duration)))) %>% 
    # Encode how much formant movement was observed 
    # (this is a linear value in the Hz domain;
    # there are other ways of doing this)
    group_by(Locuteur, Sexe, Vowel) %>%
    mutate(f1visc = max(f1) - min(f1),
           f2visc = max(f2) - min(f2),
           f3visc = max(f3) - min(f3)) %>%
    ungroup
files_to_save <- c("data.wide", "data.ss", "data.f0", "data.long", "data.wide.ss", "data.wide.ss.sum", "data.wide.visc.sum", "Vowel_space_path", "IPA_vowels")
folder_to_save_objects = '/Users/rosingle/Desktop/praatscript/output/'
setwd(folder_to_save_objects)
save(list = files_to_save, file = "testmyself.RData")