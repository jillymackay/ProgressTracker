library(tidyverse)



dat <- tibble(goal = 20000,
              written = 5739) %>% 
  mutate(perc = written/goal,
         unwritten = goal-written) %>% 
  pivot_longer(cols = c(goal:unwritten),
               names_to = "trait",
               values_to = "words")


dat %>% 
  filter(trait %in% c("written", "unwritten")) %>% 
  ggplot(aes(x = 1, y = words, fill = trait)) +
  geom_bar(stat = "identity") +
  coord_flip()
