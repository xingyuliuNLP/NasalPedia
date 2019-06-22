# chinese data
dataSimpleChineseMan = read.csv("//Users/rosingle/Documents/theseAnalysis/20juin/output/chineseManSimpleVowels.csv")
# 
# datawang = reshape(dat1, idvar = "vowel", timevar = "percentage", direction = "wide")
dataSimpleChineseMan
class(dataSimpleChineseMan)
names(dataSimpleChineseMan)[names(dataSimpleChineseMan) == "number"] <- "percent"
colnames(dataSimpleChineseMan)

# change to IPA
IPA_vowels <- c("a", "ɤ",'i','u','y')
dataSimpleChineseMan$vowelIPA <- IPA_vowels[as.numeric(dataSimpleChineseMan$vowel)]
Vowel_space_path <- c("a","ee",'i','u','y')

trajectoryChineseSimple = dataSimpleChineseMan %>%
    gather("formant", "hz", starts_with("f"))  %>%
    # change order here
    mutate(vowel =factor(vowel,levels = c("a","i","u","y","ee"))) %>%
    # largely useless here
 unite(formant_id, formant, vowel, sep = "_", remove = FALSE) %>%
        mutate(class = case_when(vowel %in% c("a", "yi", "wu", "yu", "fu", "e", "er", "zi", "zhi","ee","i","u","y") ~ "mono", vowel %in% c("ao", "ou", "bai", "ban", "bang", "wo", "ya", "yin", "ying", "yue", "bao", "bei", "ben", "beng", "bo", "wa", "ya", "ye") ~ "diph", vowel %in% c("yue", "yao", "wai", "wei", "you") ~ "triph")) %>%
        mutate(class = factor(class, levels = c("mono", "diph", "triph")))
        # filter(class %in% hehe)
   # ggplot(trajectoryWang, aes(x = percent, y = hz, group = formant_id, color = class)) +
   ggplot(trajectoryChineseSimple, aes(x = percent, y = hz, group = formant, color=formant)) +
        geom_line(aes(group = formant_id)) +
  # aes(group=interaction(formandt_id,subject),
  #     color=subject, linetype=subject) +
  # geom_line(aes(group = interaction(formant_id,subject),linetype = subject)) +
  facet_wrap(~ vowelIPA, ncol = 5) +
  # facet_wrap(~class + vowel, ncol = 5) +
        theme_classic() + ggtitle("Trajectoire formantique des monophtongues \n en chinois (locuteur masculin)") + ylab("Fréquence (Hz)") + xlab("Temps (pourcentage)") +
    theme(plot.title = element_text(hjust = 0.5))
ggsave("chineseManSimple.png") 