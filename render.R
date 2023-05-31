library(rmarkdown)
library(palmerpenguins)
library(tidyverse)

# islands <- c("Biscoe", "Dream", "Torgersen")

islands <- penguins %>% 
  distinct(island) %>% 
  pull(island) %>% 
  as.character()

reports <- tibble(
  input = "report.Rmd",
  output_file = str_glue("{islands}.html"),
  params = map(islands, ~ list(penguin_island = .))
)

pwalk(reports, render)

# render(input = "report.Rmd",
#        output_file = "biscoe.html",
#        params = list(
#          penguin_island = "Biscoe"
#        ))



