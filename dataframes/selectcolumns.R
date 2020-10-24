############
## base R ##
############

name_treat <- person[,c("name", "fav_treat")]
name_treat2 <- subset(person, select=c("name", "fav_treat"))


###########
## dplyr ##
###########

library(dplyr)

name_treat3 <- person %>%
  select(name,
         fav_treat)
