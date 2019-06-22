dataFrenchManSimple = read.csv("/Users/rosingle/Documents/theseAnalysis/20juin/output/formantDataBeforePiezo/frenchManSimpleVowels.csv")

# 
# datawang = reshape(dat1, idvar = "vowel", timevar = "percentage", direction = "wide")
dataFrenchManSimple
class(dataFrenchManSimple)
names(dataFrenchManSimple)[names(dataFrenchManSimple) == "number"] <- "percent"
colnames(dataFrenchManSimple)

# change to IPA
remapping <- c(eu ="ø", oe = "œ", ao = "ɔ",i = "i", a = "a", e = "e", ai = "ɛ", u = "u", y = "y", o = "o",angfr = "ɑ̃",onfr ="ɔ̃",ainfr = "ɛ̃" ,ang="ang" ,on="on" ,an="an" )
dataFrenchManSimple$unicodevowel <- remapping[as.character(dataFrenchManSimple$vowel)]
# IPA_vowels <- c("a", "ɤ",'i','u','y')
# dataChineseManDiphTriph$vowelIPA <- IPA_vowels[as.numeric(dataChineseManDiphTriph$vowel)]
# Vowel_space_path <- c("a","ee",'i','u','y')

trajectoryFrenchManSimple = dataFrenchManSimple %>%
    gather("formant", "hz", starts_with("f"))  %>%
    # change order here
    # mutate(vowel =factor(vowel,levels = c("a","i","u","y","ee"))) %>%
    # largely useless here
    unite(formant_id, formant, vowel, sep = "_", remove = FALSE) %>%
    mutate(class = case_when(vowel %in% c("a", "yi", "wu", "yu", "fu", "e", "er", "zi", "zhi","ee","i","u","y") ~ "mono", vowel %in% c("ao", "ou", "bai", "ban", "bang", "wo", "ya", "yin", "ying", "yue", "bao", "bei", "ben", "beng", "bo", "wa", "ya", "ye","ai","ei","ia","ie","io") ~ "diph", vowel %in% c("yue", "yao", "wai", "wei", "you","iao") ~ "triph")) %>%
    mutate(class = factor(class, levels = c("mono", "diph", "triph")))
# filter(class %in% hehe)
# ggplot(trajectoryWang, aes(x = percent, y = hz, group = formant_id, color = class)) +
ggplot(trajectoryFrenchManSimple, aes(x = percent, y = hz, group = formant, color=formant)) +
    geom_line(aes(group = formant_id)) +
    # aes(group=interaction(formandt_id,subject),
    #     color=subject, linetype=subject) +
    # geom_line(aes(group = interaction(formant_id,subject),linetype = subject)) +
    facet_wrap(~unicodevowel, ncol = 5) +
    # facet_wrap(~class + vowel, ncol = 5) +
    theme_classic() + ggtitle("Trajectoire formantique des monophtongues \n en français (locuteur masculin)") + ylab("Fréquence (Hz)") + xlab("Temps (pourcentage)") + 
    theme(plot.title = element_text(hjust = 0.5)) 
ggsave("frenchManSimple.png")
