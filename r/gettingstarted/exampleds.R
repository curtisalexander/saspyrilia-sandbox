library(tibble)

foods <- tibble::tribble(
  ~names, ~fruit_veg, ~treat, ~age,
  "Alice", "apple", "apple pie", 10,
  "Balin", "banana", "bananas foster", 53,
  "Cal", "carrot", "carrot cake", 34,
  "Dara", "dates", "doughnut", 83,
  "Ezekiel", "elderberry", "elderberry tart", 4,
  "Frances", "fig", "fig bars", 34
)
