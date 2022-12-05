setwd('/Users/matthewlaw/Documents/advent_of_code/2022/4')

library(tidyverse)

input <- read.delim("input.txt", header = F)

input |> 
  separate(V1, sep = ',', into = c('first_pair', 'second_pair'), remove = F) |> 
  separate(first_pair, sep = '-', into = c('first_lower', 'first_upper')) |> 
  separate(second_pair, sep = '-', into = c('second_lower', 'second_upper')) |> 
  mutate(across(!V1, as.numeric)) |> 
  mutate(contains = case_when((first_lower >= second_lower & first_upper <= second_upper) |
                              (second_lower >= first_lower & second_upper <= first_upper)
                              ~ T)) |> 
  count(contains) |> filter(contains == T) |> pull(n) -> part_one_answer


input |> 
  separate(V1, sep = ',', into = c('first_pair', 'second_pair'), remove = F) |> 
  separate(first_pair, sep = '-', into = c('first_lower', 'first_upper')) |> 
  separate(second_pair, sep = '-', into = c('second_lower', 'second_upper')) |> 
  mutate(across(!V1, as.numeric)) |> 
  mutate(contains = case_when((first_upper >= second_lower & first_lower <= second_lower) |
                              (second_upper >= first_lower & second_lower <= first_lower)
                              ~ T))  |> 
  count(contains) |> filter(contains == T) |> pull(n) -> part_two_answer