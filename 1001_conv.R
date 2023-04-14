library(tidyverse)

# Didn't fix in code: The War Game (1966

movies <- read_tsv(
  "C:/Users/einar/OneDrive/Desktop/list.txt",
  col_types = cols(.default = "c")
)
colnames(movies) <- c("title", "rating")

# Filter out unnecessary rows
movies <- movies %>%
  filter(!is.na(rating))

# Fix the title and separate year
movies <- movies %>%
  mutate(title = str_sub(title, str_locate(title, "\\. ")[,"end"]+1)) %>%
  mutate(year = as.integer(str_sub(title, -5, -2))) %>%
  mutate(title = str_sub(title, 1, nchar(title) - 7))

# Fix ratings
movies <- movies %>%
  mutate(rating = as.numeric(gsub(",", ".", rating)))

# Write out
write_csv(movies, "C:/Users/einar/OneDrive/Desktop/1001_movies2.csv")