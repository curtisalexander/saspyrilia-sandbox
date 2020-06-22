library(dplyr)

######################
## single condition ##
######################

# base
sweet_tooth_base <- person[person[["sweet_tooth"]] == "yes",]

# dplyr
sweet_tooth_dplyr <- person %>%
  filter(sweet_tooth == "yes")



#########################
## multiple conditions ##
#########################

# base
sweet_tooth_older_base <- person[person[["sweet_tooth"]] == "yes" &
                                 person[["age"]] > 20,]

# dplyr
sweet_tooth_older_dplyr <- person %>%
  filter(sweet_tooth == "yes",
         age > 20)
