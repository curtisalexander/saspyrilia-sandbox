library(dplyr)
library(purrr)
library(stringr)
library(tibble)

df <- tibble::tribble(
  ~a, ~`col with   space`, ~` col_with_ws_prefix`, ~COLwithMIXEDCaSE,
  1, 2, 3, 4,
  5, 6, 7, 8,
)

# rename all columns using function provided
rename_cols <- function(df, f) {
  colnames <- dplyr::tbl_vars(df)
  colnames_renamed <- purrr::map(colnames, ~ f(.x)) %>% purrr::flatten_chr()
  dplyr::rename_all(df, ~ colnames_renamed)
}

# function to use on an individual column name
string_to_lower_and_ws_cleaned_up <- function(x) {
  tolower(x) %>% stringr::str_trim() %>% stringr::str_replace_all(" +", "_")
}

df_clean <- df %>%
  rename_cols(string_to_lower_and_ws_cleaned_up)
