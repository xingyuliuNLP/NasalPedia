library("ggplot2")
library("dplyr")
library("scales")
folder_with_saved_objects <- "/Users/rosingle/Desktop/praatscript/output/wangRdata"
setwd(folder_with_saved_objects)
load("testmyselfSimple.RData")
px_all_pts <- ggplot(data.wide.ss)+
    aes(x=f2, y=f1, 
        label=Vowel.IPA, 
        color=Vowel.ordered)+
    scale_x_reverse(name="F2 (Hz)")+scale_y_reverse(name="F1 (Hz)")+
    geom_text()+
    theme_bw()+
    theme(legend.position="none")+
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
              size=1.0)+
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

# px_vowel_spectro_adults <- px_vowel_spectro_female %+%
#     (data.long %>%
#          dplyr::filter(Locuteur=="Apprenant"))+
#     aes(group=interaction(Sexe,formant),
#         color=Sexe, linetype=Sexe)+
#     scale_color_manual(values = c("Femme" = "#008523", 
#                                   "Homme" = "black"))+
#     scale_linetype_manual(values = c("Femme" = "solid", 
#                                      "Homme" = "dashed"))
# px_vowel_spectro_adults
