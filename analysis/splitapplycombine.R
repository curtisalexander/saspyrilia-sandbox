library(dplyr)
library(tibble)

person <- tibble::tribble(
  ~names, ~fav_fruit_veg, ~fav_treat, ~sweet_tooth, ~age,
  "Alice", "apple", "apple pie", "yes", 10,
  "Balin", "banana", "bananas foster", "yes", 53,
  "Cal", "carrot", "carrot cake", "no", 34,
  "Dara", "dates", "doughnut", "yes", 83,
  "Ezekiel", "elderberry", "elderberry tart", "no", 4,
  "Frances", "fig", "fig bars", "no", 34
)

sweet_tooth_by_age <- person %>%
  group_by(sweet_tooth) %>%
  summarise(age_cnt = n(),
            age_mean = mean(age),
            .groups = "keep")
