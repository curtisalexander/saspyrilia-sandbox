library(tibble)

person <- tibble::tribble(
  ~names, ~fav_fruit_veg, ~fav_treat, ~age,
  "Alice", "apple", "apple pie", 10,
  "Balin", "banana", "bananas foster", 53,
  "Cal", "carrot", "carrot cake", 34,
  "Dara", "dates", "doughnut", 83,
  "Ezekiel", "elderberry", "elderberry tart", 4,
  "Frances", "fig", "fig bars", 34
)
