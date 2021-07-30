library(tidyverse)



dat <- tibble(goal = 20000,
              written = 7357) %>% 
  mutate(perc = written/goal,
         unwritten = goal-written) %>% 
  pivot_longer(cols = c(goal:unwritten),
               names_to = "trait",
               values_to = "words")


dat %>% 
  filter(trait %in% c("written", "unwritten")) %>% 
  ggplot(aes(x = 1, y = words, fill = trait)) +
  geom_bar(stat = "identity") +
  nord::scale_fill_nord(palette = "lumina") +
  theme_classic() +
  coord_flip()+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) 

ggsave("output.png")
