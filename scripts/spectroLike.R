library("ggplot2")
library("reshape2")
library("dplyr")
library("devtools")
library("scales")
library("animation")
library("tidyr")
rawdata <- read.csv("/Users/rosingle/Documents/theseAnalysis/arec2019/charlotteVSxingyu/totalbgmw.csv")
# View(rawdata)
drawTrajetOne <- function(hehe) {
  # rawdata$vowel <- ordered(rawdata$vowel,
  #                          levels = c("a", "yi", "wu", "yu", "e", "er",
  #                                     "ao", "bai", "bei", "wo", "yue",
  #                                     "wai", "wei", "yao", "you"))
  trajectory <- rawdata %>%
  # select(-contains("f3")) %>%
  filter(!vowel %in% c("bin", "bing", "ben", "beng", "ban", "bang", "ying", "yin", "fu") & subject == "chinese") %>%
  # Take the median of each vowel at each timepoint
  group_by(vowel) %>%
  # f1 f2 or f3
  summarize_at(vars(f1.10:f3.90), median, na.rm = TRUE) %>%
  # Convert it into a "very tall" format
  gather("formant_percent", "hz", starts_with("f")) %>%
        separate(formant_percent, into = c("formant", "percent"), extra = "drop") %>%
  # Create the formant id column
  unite(formant_id, formant, vowel, sep = "_", remove = FALSE) %>%
        mutate(class = case_when(vowel %in% c("a", "yi", "wu", "yu", "fu", "e", "er", "zi", "zhi") ~ "mono", vowel %in% c("ao", "ou", "bai", "ban", "bang", "wo", "ya", "yin", "ying", "yue", "bao", "bei", "ben", "beng", "bo", "wa", "ya", "ye") ~ "diph", vowel %in% c("yue", "yao", "wai", "wei", "you") ~ "triph")) %>%
        mutate(class = factor(class, levels = c("mono", "diph", "triph"))) %>%
        filter(class %in% hehe)
  View(trajectory)
  chineseAlone = ggplot(trajectory, aes(x = percent, y = hz, group = formant_id, color = class)) +
        geom_line(aes(group = formant_id)) +
  # aes(group=interaction(formandt_id,subject),
  #     color=subject, linetype=subject) +
  # geom_line(aes(group = interaction(formant_id,subject),linetype = subject)) +
  facet_wrap(~class + vowel, ncol = 5) +
        theme_classic()
  ggsave("chineseAlone.png")
}

drawTrajetOverlay <- function(hehe) {
  # rawdata$vowel <- ordered(rawdata$vowel,
  #                          levels = c("a", "yi", "wu", "yu", "e", "er",
  #                                     "ao", "bai", "bei", "wo", "yue",
  #                                     "wai", "wei", "yao", "you"))
  trajectory <- rawdata %>%
  # select(-contains("f3")) %>%
  filter(!vowel %in% c("bin", "bing", "ben", "beng", "ban", "bang", "ying", "yin", "fu")) %>%
  # Take the median of each vowel at each timepoint
  group_by(vowel, subject) %>%
  # f1 f2 or f3
  summarize_at(vars(f1.10:f3.90), median, na.rm = TRUE) %>%
  # Convert it into a "very tall" format
  gather("formant_percent", "hz", starts_with("f")) %>%
        separate(formant_percent, into = c("formant", "percent"), extra = "drop") %>%
  # Create the formant id column
  unite(formant_id, formant, vowel, sep = "_", remove = FALSE) %>%
     mutate(class = case_when(vowel %in% c("a", "yi", "wu", "yu", "fu", "e", "er", "zi", "zhi") ~ "mono", vowel %in% c("ao", "ou", "bai", "ban", "bang", "wo", "ya", "yin", "ying", "yue", "bao", "bei", "ben", "beng", "bo", "wa", "ya", "ye") ~ "diph", vowel %in% c("yue", "yao", "wai", "wei", "you") ~ "triph")) %>%
        mutate(class = factor(class, levels = c("mono", "diph", "triph"))) %>%
    filter(class %in% hehe)
  # View(trajectory)
  chinese = ggplot(trajectory, aes(x = percent, y = hz, group = formant_id, color = class)) +
  # geom_line(aes(group = formant_id)) +
  # aes(group=interaction(formandt_id,subject),
  #     color=subject, linetype=subject) +
  geom_line(aes(group = interaction(formant_id, subject), linetype = subject)) +
        facet_wrap(~vowel + class, ncol = 5) +
            theme_bw()
  # theme(panel.border=element_blank(), axis.line=element_line())

  # theme_classic() +
  coord_capped_cart(bottom = 'both', left = 'both')

  # theme(panel.margin=unit(.05, "lines"))
  ggsave("chinese.png")
}

run <- function() {
  choice = c("mono")
  # drawTrajetOverlay(choice)
  drawTrajetOne(choice)
}
run()

# appear order in legend
# scale_color_discrete(breaks = c("a", "yi", "wu", "yu", "e", "er",
#                                 "ao", "bai", "bei", "wo", "yue",
#                                 "wai", "wei", "yao", "you")) +
# add factor
# class = c("a", "yi", "wu", "yu", "e","er","ao", "bai", "ban", "bang", "wo", "ya","wu","yin","ying","yue","yao", "wai","wei")
# length(class)
# class[class %in% c("a", "yi", "wu", "yu", "e","er")] <- "monophtongues"
# class[class %in% c("ao", "bai", "ban", "bang", "wo", "ya","wu","yin","ying","yue")]   <- "diphtongues"
# class[class %in% c( "yao", "wai","wei")]   <- "triphtongues"
# class <- as.factor(class)
# head(class)

#
# colnames(rawdata) <- c("file","Duration",
#                        "f0ss","f1ss","f2ss","f3ss",
#                        "f110","f210","f310",
#                        "f120","f220","f320",
#                        "f130","f230","f330",
#                        "f140","f240","f340",
#                        "f150","f250","f350",
#                        "f160","f260","f360",
#                        "f170","f270","f370",
#                        "f180","f280","f380")
# rawdata[rawdata == 0] <- NA
#
# # Count the total number of NA values
# sum(is.na(rawdata))
# data.melt <- melt(rawdata, id.vars = c("file","Duration"))
# data.melt$Subject <- ifelse(substr(rawdata$file,1,1) %in% c("m","b"), "fr", "cn")
# data.melt$Age    <- ifelse(substr(rawdata$file,1,1) %in% c("m","w"), "Adult", "Child")
# data.melt$Talker <- substr(data.melt$file,2,3)
# data.melt$Vowel  <- substr(data.melt$file,4,8) %>% as.factor
# levels(data.melt$Vowel)
# IPA_vowels <- c("a","ao","bai","ban","bang","bao","bei","ben","beng","bo","e","er","fu","ou","wa","wai","wei","wo","wu","ya","yao","ye","yi","yin","ying","you","yu","yue","zhi","zi")
# data.melt$Vowel.IPA <- IPA_vowels[as.numeric(data.melt$Vowel)]
# # space path !!!
# Vowel_space_path <- c("a","yi","yu","wu","e","er","ao","bai","bao","bei","bo","ou","fu","wa","wai","wei","wo","ya","yao","ye","ben","beng","ban","bang","yin","ying","you","yue","zhi","zi")
# data.melt$Vowel.ordered <- factor(data.melt$Vowel, levels = Vowel_space_path)
# # Explicitly declare the number of each vowel in the vowel space path order
# data.melt$Vowel.order.num <- as.numeric(data.melt$Vowel.ordered)
# data.melt$measure <- substr(data.melt$variable, 1,2)
# data.melt$Time <- substr(data.melt$variable, 3,4) %>% as.numeric
# unique(data.melt[, c("variable","Time")])
# data.melt$variable <- NULL
# data.f0 <- data.melt %>%
#     dplyr::filter(measure=="f0") %>%
#     mutate(f0 = value) %>%
#     select(-value)
# data.ss <- data.melt[is.na(data.melt$Time),] %>%
#     arrange(file, Vowel.order.num, measure, Time) %>%
#     mutate(formant = substr(measure, 2,2) %>%
#                as.character) %>%
#     filter(measure != "f0") %>%
#     left_join(., data.f0[,c("file","f0")]) %>%
#     mutate(Frequency = value) %>%
#     select(-value)
# data.long <- data.melt[!is.na(data.melt$Time),] %>%
#     arrange(file, Vowel.order.num, measure, Time) %>%
#     mutate(formant = substr(measure, 2,2) %>% as.character) %>%
#     left_join(., data.f0[,c("file","f0")]) %>%
#     mutate(Frequency = value) %>%
#     select(-value)
#
# # We won't need these objects anymore, so clear them from the workspace
# rm(rawdata, data.melt)
# keep_one_formant <- function(data, formant){
#     temp <- data[data$measure==formant,] %>%
#         select(-measure, -formant) %>%
#         mutate(temp.formant = Frequency) %>%
#         select(-Frequency)
#     # rename the temporary column to match the input argument
#     names(temp)[names(temp)=="temp.formant"] <- formant
#     return(temp)
# }
# data.wide <- data.long %>%
#     keep_one_formant(., "f1") %>%
#     left_join(., keep_one_formant(data.long, "f2")) %>%
#     left_join(., keep_one_formant(data.long, "f3")) %>%
#     group_by(file) %>%
#     arrange(Time) %>% ungroup
# data.wide.ss <-  data.ss %>%
#     keep_one_formant(., "f1") %>%
#     left_join(., keep_one_formant(data.ss, "f2")) %>%
#     left_join(.,keep_one_formant(data.ss, "f3")) %>%
#     select(-Time)
# data.wide.ss.sum <- data.wide.ss %>%
#     group_by(Subject, Age,
#              Vowel, Vowel.ordered, Vowel.order.num, Vowel.IPA) %>%
#     summarise(Duration = mean(Duration, na.rm = TRUE),
#               f0.sd= (sd(f0, na.rm = TRUE)) %>% round(., 2),
#               f1.sd= (sd(f1, na.rm = TRUE)) %>% round(., 1),
#               f2.sd= (sd(f2, na.rm = TRUE)) %>% round(., 1),
#               f3.sd= (sd(f3, na.rm = TRUE)) %>% round(., 1),
#               f0= mean(f0, na.rm = TRUE) %>% round(., 1),
#               f1= mean(f1, na.rm = TRUE) %>% round(., 0),
#               f2= mean(f2, na.rm = TRUE) %>% round(., 0),
#               f3= mean(f3, na.rm = TRUE) %>% round(., 0))
# data.wide.visc.sum <- data.wide %>%
#     group_by(Subject, Age, Vowel, Vowel.IPA, Time) %>%
#     summarise(f1.sd = sd(f1, na.rm=TRUE),
#               f2.sd = sd(f2, na.rm=TRUE),
#               f3.sd = sd(f3, na.rm=TRUE),
#               f1 = mean(f1, na.rm=TRUE),
#               f2 = mean(f2, na.rm=TRUE),
#               f3 = mean(f3, na.rm=TRUE),
#               Duration.sd = sd(Duration, na.rm=TRUE),
#               Duration = mean(Duration, na.rm=TRUE)) %>%
#     ungroup %>%
#     # Encode duration as a normalized value between 0 and 1
#     group_by(Age, Subject) %>%
#     mutate(Duration_norm = (Duration - min(Duration)) /
#                ((max(Duration) - min(Duration)))) %>%
#     # Encode how much formant movement was observed
#     # (this is a linear value in the Hz domain;
#     # there are other ways of doing this)
#     group_by(Age, Subject, Vowel) %>%
#     mutate(f1visc = max(f1) - min(f1),
#            f2visc = max(f2) - min(f2),
#            f3visc = max(f3) - min(f3)) %>%
#     ungroup
# files_to_save <- c("data.wide", "data.ss", "data.f0", "data.long", "data.wide.ss", "data.wide.ss.sum", "data.wide.visc.sum", "Vowel_space_path", "IPA_vowels")
#
# setwd(folder_to_save_objects)
# save(list = files_to_save, file = "arec.RData")
#
#
#
#
# ## visualizing part
# load("arec.RData")
# px_all_pts <- ggplot(data.wide.ss)+
#     aes(x=f2, y=f1,
#         label=Vowel.IPA,
#         color=Vowel.ordered)+
#     scale_x_reverse(name="F2 (Hz)")+scale_y_reverse(name="F1 (Hz)")+
#     geom_text()+
#     theme_bw()+
#     theme(legend.position="none")+
#     facet_wrap(~ Age + Subject, scales="free")
# ## facet_wrap , scales="free" after Subject
# ## plot all vowels
# px_all_pts
# px_vowel_means_4_panel <- px_all_pts %+%
#     data.wide.ss.sum +
# aes(label=Vowel.IPA, color=NULL)+
#     guides(color="none")
# px_vowel_means_4_panel
# ## plot all vowels means
# px_v_space_by_Subject <- data.wide.ss.sum %>%
#     dplyr::filter(Vowel!="er") %>%
#     group_by(Age, Subject) %>%
#     arrange(as.numeric(Vowel.order.num)) %>%
#     ungroup %>%
#     ggplot(., aes(x=f2, y=f1, color=Subject))+
#     geom_path()+
#     geom_text(aes(label=Vowel.IPA), show.legend=FALSE)+
#     scale_x_reverse() + scale_y_reverse()+
#     theme_bw()+
#     scale_color_manual(values = c("cn" = "black",
#                                   "fr" = "#22BA36"))+
#     facet_wrap( ~ Age, scales="free")
# px_v_space_by_Subject
# ## plot vowel space by subject
# ordered_IPA_vowels <- data.long[,c("Vowel.IPA","Vowel.order.num")] %>%
#     unique %>%
#     arrange(Vowel.order.num) %>%
#     `[[`(., "Vowel.IPA")
# data.long$Vowel.ordered.IPA <- factor(data.long$Vowel.IPA, levels = ordered_IPA_vowels)
# px_vowel_spectro_female <- data.long %>%
#     dplyr::filter(Age=="Adult", Subject=="cn" , Vowel.IPA %in% c("a")) %>%
#     ggplot(., aes(x=Time, y=Frequency, group=as.factor(formant)))+
#     geom_line(stat="summary", fun.y="mean",
#               aes(color=Subject),
#               size=1.0)+
#     coord_cartesian(ylim = c(0,3500))+
#     scale_color_manual(name="Talker\nSubject",
#                        values = c("cn" = "black",
#                                   "fr" = "#008523"))+
#     labs(x="Time (% of vowel duration)",
#          y= "Frequency (Hz)")+
#     theme_bw()+
#     theme(legend.key.width = unit(1.8, "line"))+
#     facet_wrap(~Vowel.ordered.IPA)
# px_vowel_spectro_female
#
# ## plot spectro china
#
# px_vowel_spectro_male <- px_vowel_spectro_female %+%
#     (data.long %>%
#          filter(Age=="Adult", Subject=="fr"))
# # ,Vowel.IPA %in% c("a","yi","wu")
# px_vowel_spectro_male
#
# ## plot spectro france
#
# px_vowel_spectro_adults <- px_vowel_spectro_female %+%
#     ## ,Vowel.IPA %in% c("a")
#     (data.long %>%
#          dplyr::filter(Age=="Adult",Vowel.IPA %in% c("fu","wu")))+
#     aes(group=interaction(Subject,formant),
#         color=Subject, linetype=Subject)+
#     scale_color_manual(values = c("cn" = "black",
#                                   "fr" = "#008523"))+
#     scale_linetype_manual(values = c("cn" = "solid",
#                                      "fr" = "dashed"))
# px_vowel_spectro_adults
#
# ## plot spectro overlap
#
#
#
# ## gif
# px_visc <- ggplot(data.wide.visc.sum) +
#     aes(x=f2, y=f1, group=Vowel)+
#     scale_x_reverse(name="F2 (Hz)")+scale_y_reverse(name="F1 (Hz)")+
#     geom_path()+
#     theme_bw()+
#     facet_wrap( ~ Subject + Age, scales="free")
# px_visc
# px_visc.label <- px_visc +
#     geom_label(data=data.wide.visc.sum %>% filter(Time==80),
#                aes(label=Vowel.IPA))
# px_visc.label
# px_visc.label.circ <- px_visc +
#     geom_point(data=data.wide.visc.sum %>% filter(Time==80),
#                shape=21, fill="white", size=9)+
#     geom_text(data=data.wide.visc.sum %>% filter(Time==80),
#               aes(label=Vowel.IPA))
# px_visc.label.circ
# px_visc.lab.IPA.dur_color <- px_visc.label.circ+
#     aes(color=Duration_norm)+
#     scale_color_gradient(name="Duration\n(within talker)",
#                          high = "red", low = "blue",
#                          breaks=c(0,1),
#                          labels=c("Shortest","Longest"))+
#     guides(color=guide_colorbar(),
#            text="none")
# px_visc.lab.IPA.dur_color
# # filter gif 1
# data_to_plot <- data.wide.visc.sum %>%
#     dplyr::filter(Subject=="cn", Age=="Adult")
# movie_filename <- "Vowel_chart_cnfr.gif"
# fixed_formant_axes <- coord_cartesian(xlim = c(800, 3000), ylim = c(250,1000))
# axis_labels <- labs(x="F2 (Hz)", y="F1 (Hz)")
# start_time <- 10
# end_time <- 80
# symbol_size <- 8
# saveGIF({
#     # loop through the vowel chart in time (8 plots)
#     for (temp_time in unique(data_to_plot$Time)){
#         px_temp <- data_to_plot %>%
#             ggplot(.)+
#             aes(x=f2, y=f1, group=Vowel)+
#             scale_x_reverse()+scale_y_reverse()+
#             fixed_formant_axes + axis_labels+
#             geom_path()+
#             geom_point(data=data_to_plot %>% filter(Time==temp_time),
#                        shape=21, fill="white", size=12)+
#             geom_text(data=data_to_plot %>% filter(Time==temp_time),
#                       aes(label=Vowel.IPA))+
#             theme_bw()+
#             facet_wrap( ~ Subject + Age, scales="free")
#         print(px_temp)
#     }
#
#     # hold offglide in place, fade out (5 plots)
#     for (temp_alpha in seq(1,0,length.out = 4)){
#         #     px_fadeout <- data_to_plot[data_to_plot$Time ==end_time,] %>%
#         px_fadeout <- data_to_plot %>%
#             ggplot(.,
#                    aes(x=f2, y=f1, group=Vowel))+
#             scale_x_reverse()+scale_y_reverse()+
#             fixed_formant_axes + axis_labels+
#             geom_path(alpha=1)+
#             geom_point(data=data_to_plot %>% filter(Time==end_time),
#                        alpha=temp_alpha,
#                        shape=21, fill="white", size=12)+
#             geom_text(data=data_to_plot %>% filter(Time==end_time),
#                       alpha=temp_alpha,
#                       aes(label=Vowel.IPA))+
#             theme_bw()+
#             facet_wrap( ~ Subject + Age, scales="free")
#         print(px_fadeout)
#     }
#
# },
# # intervals: hold first and 8th longer, fly through 9-12
# interval = c(0.5, rep(0.2, 6),0.5, rep(0.1,5)),
# # interval = 0.2,
# ani.height = 400, ani.width = 550,
# movie.name = movie_filename
# )
# ## filter gif 2
# data_to_plot <- data.wide.visc.sum %>%
#     dplyr::filter(Subject=="fr", Age=="Adult",Vowel.IPA %in% c("a","ao","yi","wu"))
# movie_filename <- "Vowel_chart_cnfr2.gif"
# fixed_formant_axes <- coord_cartesian(xlim = c(800, 3000), ylim = c(250,1000))
# axis_labels <- labs(x="F2 (Hz)", y="F1 (Hz)")
# start_time <- 10
# end_time <- 80
# symbol_size <- 8
# saveGIF({
#     # loop through the vowel chart in time (8 plots)
#     for (temp_time in unique(data_to_plot$Time)){
#         px_temp <- data_to_plot %>%
#             ggplot(.)+
#             aes(x=f2, y=f1, group=Vowel)+
#             scale_x_reverse()+scale_y_reverse()+
#             fixed_formant_axes + axis_labels+
#             geom_path()+
#             geom_point(data=data_to_plot %>% filter(Time==temp_time),
#                        shape=21, fill="white", size=12)+
#             geom_text(data=data_to_plot %>% filter(Time==temp_time),
#                       aes(label=Vowel.IPA))+
#             theme_bw()+
#             facet_wrap( ~ Subject + Age, scales="free")
#         print(px_temp)
#     }
#
#     # hold offglide in place, fade out (5 plots)
#     for (temp_alpha in seq(1,0,length.out = 4)){
#         #     px_fadeout <- data_to_plot[data_to_plot$Time ==end_time,] %>%
#         px_fadeout <- data_to_plot %>%
#             ggplot(.,
#                    aes(x=f2, y=f1, group=Vowel))+
#             scale_x_reverse()+scale_y_reverse()+
#             fixed_formant_axes + axis_labels+
#             geom_path(alpha=1)+
#             geom_point(data=data_to_plot %>% filter(Time==end_time),
#                        alpha=temp_alpha,
#                        shape=21, fill="white", size=12)+
#             geom_text(data=data_to_plot %>% filter(Time==end_time),
#                       alpha=temp_alpha,
#                       aes(label=Vowel.IPA))+
#             theme_bw()+
#             facet_wrap( ~ Subject + Age, scales="free")
#         print(px_fadeout)
#     }
#
# },
# # intervals: hold first and 8th longer, fly through 9-12
# interval = c(0.5, rep(0.2, 6),0.5, rep(0.1,5)),
# # interval = 0.2,
# ani.height = 400, ani.width = 550,
# movie.name = movie_filename
# )
