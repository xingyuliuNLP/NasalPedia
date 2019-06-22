library("ggplot2")
library("dplyr")
library("scales")
library("animation")

filename = "testmyself_diph_wang.RData"
folder_with_saved_objects <- "/Users/rosingle/Desktop/praatscript/output/wangRdata/"
setwd(folder_with_saved_objects)
# change here
load(filename)
px_all_pts <- ggplot(data.wide.ss)+
    aes(x=f2, y=f1, 
        label=Vowel.IPA, 
        color=Vowel.ordered)+
    scale_x_reverse(name="F2 (Hz)")+scale_y_reverse(name="F1 (Hz)")+
    geom_text()+
    theme_bw()+
    theme(legend.position="none")
    facet_wrap(~ Locuteur + Sexe, scales="free")
px_all_pts

px_vowel_means_4_panel <- px_all_pts %+%
    data.wide.ss.sum +
    aes(label=Vowel.IPA, color=NULL)+
    guides(color="none")
px_vowel_means_4_panel

px_v_space_by_gender <- data.wide.ss.sum %>%
    dplyr::filter(Vowel!="er") %>% 
    group_by(Locuteur, Sexe) %>%
    arrange(as.numeric(Vowel.order.num)) %>%
    ungroup %>%
    ggplot(., aes(x=f2, y=f1, color=Sexe))+
    geom_path()+
    geom_text(aes(label=Vowel.IPA), show.legend=FALSE)+
    scale_x_reverse() + scale_y_reverse()+
    theme_bw()+
    scale_color_manual(values = c("Femme" = "black", 
                                  "Homme" = "#22BA36"))+
    facet_wrap( ~ Locuteur, scales="free")
px_v_space_by_gender

px_v_space_by_gender_age <- px_v_space_by_gender+
    aes(linetype=Locuteur) +
    facet_null()
px_v_space_by_gender_age

ordered_IPA_vowels <- data.long[,c("Vowel.IPA","Vowel.order.num")] %>% 
    unique %>%
    arrange(Vowel.order.num) %>%
    `[[`(., "Vowel.IPA")

data.long$Vowel.ordered.IPA <- factor(data.long$Vowel.IPA, levels = ordered_IPA_vowels)

px_vowel_spectro_female <- data.long %>%
    dplyr::filter(Locuteur=="Apprenant", Sexe=="Femme") %>%
    ggplot(., aes(x=Time, y=Frequency, group=as.factor(formant)))+
    geom_line(stat="summary", fun.y="mean", 
              aes(color=Sexe),
              size=0.5)+
    coord_cartesian(ylim = c(0,3500))+
    scale_color_manual(name="Sexe",
                       values = c("Femme" = "#008523", 
                                  "Homme" = "black"))+
    labs(x="Temps (Pourcentage)",
         y= "Fréquence (Hz)")+
    theme_bw()+
    theme(legend.key.width = unit(1.8, "line"))+
    facet_wrap(~Vowel.ordered.IPA)
px_vowel_spectro_female

px_vowel_spectro_male <- px_vowel_spectro_female %+%
    (data.long %>%
         filter(Locuteur=="Apprenant", Sexe=="Homme"))

px_vowel_spectro_male

px_visc <- ggplot(data.wide.visc.sum) +
    aes(x=f2, y=f1, group=Vowel)+
    scale_x_reverse(name="F2 (Hz)")+scale_y_reverse(name="F1 (Hz)")+
    geom_path()+
    theme_bw()
    # facet_wrap( ~ Gender + Age, scales="free")
px_visc
px_visc.label <- px_visc +
    geom_label(data=data.wide.visc.sum %>% filter(Time==80),
               aes(label=Vowel.IPA))
px_visc.label
px_visc.label.circ <- px_visc + 
    geom_point(data=data.wide.visc.sum %>% filter(Time==80),
               shape=21, fill="white", size=9)+
    geom_text(data=data.wide.visc.sum %>% filter(Time==80),
              aes(label=Vowel.IPA))
px_visc.label.circ

px_visc.lab.IPA.dur_color <- px_visc.label.circ+
    aes(color=Duration_norm)+
    scale_color_gradient(name="Duration\n(within talker)",
                         high = "red", low = "blue",
                         breaks=c(0,1),
                         labels=c("Shortest","Longest"))+
    guides(color=guide_colorbar(),
           text="none")
px_visc.lab.IPA.dur_color

data_to_plot <- data.wide.visc.sum %>% 
    dplyr::filter(Sexe=="Homme", Locuteur=="Chinois")
movie_filename <- "Vowel_chart_man.gif"
fixed_formant_axes <- coord_cartesian(xlim = c(800, 3000), ylim = c(250,1000))
axis_labels <- labs(x="F2 (Hz)", y="F1 (Hz)")
start_time <- 10
end_time <- 80
symbol_size <- 8

saveGIF({
    # loop through the vowel chart in time (8 plots)
    for (temp_time in unique(data_to_plot$Time)){
        px_temp <- data_to_plot %>%
            ggplot(.)+
            aes(x=f2, y=f1, group=Vowel)+
            scale_x_reverse()+scale_y_reverse()+
            fixed_formant_axes + axis_labels+
            geom_path()+
            geom_point(data=data_to_plot %>% filter(Time==temp_time),
                       shape=21, fill="white", size=12)+
            geom_text(data=data_to_plot %>% filter(Time==temp_time),
                      aes(label=Vowel.IPA))+
            theme_bw() +
            facet_wrap( ~ Sexe + Locuteur, scales="free") +
        print(px_temp)
    }
    
    # hold offglide in place, fade out (5 plots)
    for (temp_alpha in seq(1,0,length.out = 4)){
        #     px_fadeout <- data_to_plot[data_to_plot$Time ==end_time,] %>%
        px_fadeout <- data_to_plot %>%
            ggplot(., 
                   aes(x=f2, y=f1, group=Vowel))+
            scale_x_reverse()+scale_y_reverse()+
            fixed_formant_axes + axis_labels+
            geom_path(alpha=1)+
            geom_point(data=data_to_plot %>% filter(Time==end_time),
                       alpha=temp_alpha,
                       shape=21, fill="white", size=12)+
            geom_text(data=data_to_plot %>% filter(Time==end_time),
                      alpha=temp_alpha,
                      aes(label=Vowel.IPA))+
            theme_bw() 
        #  facet_wrap( ~ Sexe + Locuteur, scales="free")
        print(px_fadeout)
    }
    
}, 
# intervals: hold first and 8th longer, fly through 9-12
interval = c(0.5, rep(0.2, 6),0.5, rep(0.1,5)),
# interval = 0.2,
ani.height = 400, ani.width = 550,
movie.name = movie_filename
)

# px_vowel_spectro_adults <- px_vowel_spectro_female %+%
#     (data.long %>%
#          dplyr::filter(Locuteur=="Apprenant"))+
#     aes(group=interaction(Sexe,formant),
#         color=Sexe, linetype=Sexe)+
#     scale_color_manual(values = c("Femme" = "black", 
#                                   "Homme" = "#008523"))+
#     scale_linetype_manual(values = c("Femme" = "solid", 
#                                      "Homme" = "dashed"))
# px_vowel_spectro_adults
