library(purrr)
library(stringr)

# split string on comma returning first element (using strsplit)
fruit_string <- "apple, banana, carrot"
first_fruit <- strsplit(fruit_string, ",", fixed = TRUE)[[1]][1] %>%
  stringr::str_trim()

# split string on comma returning first element (using stringr)
fruit_string <- "apple, banana, carrot"
first_fruit <- stringr::str_split_n(fruit_string, ",", 1) %>%
  stringr::str_trim()


# split string on comma returning all elements (using strsplit)
fruit_string <- "apple, banana, carrot"
fruits <- strsplit(fruit_string, ",", fixed = TRUE)[[1]] %>%
  purrr::map_chr(stringr::str_trim)

# split string on comma returning all elements (using stringr)
fruit_string <- "apple, banana, carrot"
fruits <- stringr::str_split(fruit_string, ",")[[1]] %>%
  purrr::map_chr(stringr::str_trim)


