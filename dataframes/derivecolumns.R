library(dplyr)
library(magrittr)

#############################
## constant / static value ##
#############################

# new copy
hungry <- person %>%
  mutate(hungry = "yes")

# in-place
person %<>%
  mutate(hungry = "yes")



##################
## derive value ##
##################

# new copy
hungry <- person %>%
  mutate(hungry = case_when(
    (sweet_tooth == "yes") & (name %>% substr(., 1, 1) %>% tolower() %in% c("a", "e", "i", "o", "u")) ~ "yes",
    TRUE ~ "no"
  ))
